import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/create_task/provider/create_task_function.dart';
import 'package:easy_do/src/modules/profile/model/profile_model.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServicesProfileScreen {
  Future<ProfileModel?> getProfileInfo({
    required String token,
    BuildContext? context,
  }) async {
    // logSmall(message: token);
    try {
      http.Response response = await apiClient.getData(
        url: RemoteUrl.profileInfo,
        token: token,
      );

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        // if (context.mounted) {
        //   AppUtils.errorToast(message: response.body, context: context);
        // }
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error  Exception ${e.toString()}');
      return null;
    }
  }

  Future<Uint8List?> fetchImage() async {
    logSmall(message: appUserId);
    final response =
        await http.get(Uri.parse('${RemoteUrl.baseUrl}user/$appUserId/avatar'));

    if (response.statusCode == 200) {
      logSmall(message: response.bodyBytes.toString());

      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
