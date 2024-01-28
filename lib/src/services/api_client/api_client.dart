import 'dart:convert';
import 'dart:io';

import 'package:easy_do/main.dart';
import 'package:easy_do/src/services/api_client/api_request_type.dart';
import 'package:easy_do/src/services/api_client/multipart_file_with_name.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient();
  static const int timeoutRequest = 60;

  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json',
    'Vary': 'Accept',
  };

  ///get http request supported
  Future<http.Response> getData({
    required String url,
    Uri? uri,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    if (uri != null) {
      logMessage(title: "parse uri", message: uri);
    } else {
      logMessage(title: "parse url", message: Uri.parse(url));
    }

    http.Response response = await http
        .get(
      uri ?? Uri.parse(url),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    logMessage(
        title: 'get response url: ${uri ?? Uri.parse(url)}',
        message: response.body);
    return response;
  }

  static Map<String, String> currentUserHeader(String token) {
    Map<String, String> mainHeaders = {
      'Content-Type': 'application/json',
      'Vary': 'Accept',
      'Authorization': 'Bearer $token',
    };
    return mainHeaders;
  }

  String addedErrorMessage({String message = 'error'}) {
    return '{"error": "$message"}';
  }

  Future<http.Response> postData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    logMessage(title: 'post url', message: url);
    logMessage(title: 'post body', message: jsonEncode(body));
    logMessage(title: 'post token', message: token);

    http.Response response = await http
        .post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );

    logMessage(
        title: 'post response url: ${Uri.parse(url)}', message: response.body);
    return response;
  }

  /// delete http request supported
  Future<http.Response> deleteData({
    required String url,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    http.Response response = await http
        .delete(
      Uri.parse(url),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    logMessage(
        title: 'post response url: ${Uri.parse(url)}', message: response.body);
    return response;
  }

  ///put http request supported
  Future<http.Response> putData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    http.Response response = await http
        .put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    logMessage(
        title: 'post response url: ${Uri.parse(url)}', message: response.body);

    return response;
  }

  ///Multipart http request for image with from data
  Future<http.Response> multipartHttpRequest({
    required String url,
    required ApiRequestType apiRequestType,
    required String? token,
    Map<String, String>? fields,
    required Map<String, MultipartFileWithName> filePaths,
    int? timeOut,
  }) async {
    final request = http.MultipartRequest(
      ApiRequestTypeString.getApiRequestString(
        apiRequestType: apiRequestType,
      ),
      Uri.parse(url),
    );

    for (int i = 0; i < filePaths.length; i++) {
      request.files.add(
        await http.MultipartFile.fromPath(
          filePaths.keys.elementAt(i),
          filePaths.values.elementAt(i).filePath,
        ),
      );
    }

    logSmall(message: filePaths);

    filePaths.forEach((key, value) async {
      request.files.add(
        await http.MultipartFile.fromPath(
          key,
          value.filePath,
        ),
      );
    });

    if (fields != null) {
      request.fields.addAll(fields);
    }

    request.headers.addAll(
      token != null
          ? multipartHeaderWithToken(token)
          : multipartHeaderWithoutToken(),
    );

    logMessage(title: 'request header', message: request.headers);
    logMessage(title: 'request fields', message: request.fields);
    logMessage(title: 'request files', message: request.files);

    var response = await request.send().timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return streamTimeOutResponse(
          error: 'Request Time out. Please try again!',
        ); // Replace 500 with your http code.
      },
    );
    var finalResponse = await http.Response.fromStream(response);

    logMessage(title: 'final response', message: finalResponse.body);

    return finalResponse;
  }

  http.StreamedResponse streamTimeOutResponse({
    required String error,
  }) {
    Map<String, dynamic> body = {
      'any': 'value',
      'error': error,
    };

    int statusCode = 408;
    String json = jsonEncode(body);

    return http.StreamedResponse(
      Stream.value(json.codeUnits),
      statusCode,
    );
  }

  static Map<String, String> multipartHeaderWithToken(String token) {
    Map<String, String> header = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    return header;
  }

  static Map<String, String> multipartHeaderWithoutToken() {
    Map<String, String> header = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    return header;
  }

  Future asyncFileUpload(
      {required File file, required BuildContext context}) async {
    //create multipart request for POST or PATCH method
    var request =
        http.MultipartRequest("POST", Uri.parse(RemoteUrl.profileImage));
    //add text fields
    //  request.fields["text_field"] = text;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("avatar", file.path);
    request.headers.addAll(multipartHeaderWithToken(appUserToken));
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    logSmall(message: responseString);
    if (context.mounted) {
      context.pop();
    }
  }
}
