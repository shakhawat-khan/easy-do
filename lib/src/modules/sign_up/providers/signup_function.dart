import 'package:easy_do/src/services/api_client/api_client.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

final ApiClient apiClient = ApiClient();
Future<bool> createAccount(
    {required String mail,
    required String name,
    required String pass,
    required BuildContext context}) async {
  try {
    http.Response response = await apiClient.postData(
      url: RemoteUrl.createUserUrl,
      body: {
        'name': name.trim(),
        'email': mail.trim(),
        'password': pass.trim(),
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (context.mounted) {
        AppUtils.successToast(message: 'New user created', context: context);
        context.pop();
      }

      // var responseBody = await json.decode(response.body);

      // logSmall(message: responseBody.toString());

      return true;
    } else if (response.statusCode == 400) {
      if (context.mounted) {
        AppUtils.errorToast(message: response.body, context: context);
      }
    } else {
      if (context.mounted) {
        AppUtils.errorToast(message: response.body, context: context);
      }
    }
    return false;
  } catch (error) {
    if (kDebugMode) {
      print('error');
    }
    return false;
  }
}
