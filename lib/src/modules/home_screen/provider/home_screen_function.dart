import 'dart:convert';

import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/utils/api_client/api_client.dart';
import 'package:easy_do/src/utils/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// get all task list
///
///
final ApiClient apiClient = ApiClient();
Future<GetAllTaskModel?> getAllTask({
  required String token,
  required BuildContext context,
}) async {
  try {
    http.Response response = await apiClient.getData(
      url: RemoteUrl.createTask,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetAllTaskModel.fromJson(jsonDecode(response.body));
    } else {
      if (context.mounted) {
        AppUtils.errorToast(message: response.body, context: context);
      }
      return null;
    }
  } on Exception catch (e) {
    debugPrint('Error to get blog by category. Exception ${e.toString()}');
    return null;
  }
}
