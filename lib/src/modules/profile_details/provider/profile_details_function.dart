import 'package:easy_do/main.dart';
import 'package:easy_do/src/utils/api_client/api_client.dart';
import 'package:easy_do/src/utils/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

final ApiClient apiClient = ApiClient();
Future<bool> profileUpdate({
  required String age,
  required String name,
  required String email,
  BuildContext? context,
}) async {
  try {
    http.Response response = await apiClient
        .putData(token: appUserToken, url: RemoteUrl.profileInfo, body: {
      'age': age,
      'name': name,
      'email': email,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (context!.mounted) {
        AppUtils.successToast(
            message: 'Task Update successfully', context: context);
        context.pop();
      }

      return true;
    } else {
      if (context!.mounted) {
        AppUtils.errorToast(message: response.body, context: context);
      }

      return false;
    }
  } catch (error) {
    logSmall(message: error);
    return false;
  }
}
