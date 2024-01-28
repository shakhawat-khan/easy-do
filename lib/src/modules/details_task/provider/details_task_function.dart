import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_function.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/services/api_client/api_client.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

/// delete task
final ApiClient apiClient = ApiClient();
Future<bool?> deleteTask({
  required String deletetId,
  required BuildContext context,
}) async {
  try {
    http.Response response = await apiClient.deleteData(
      token: appUserToken,
      url: '${RemoteUrl.createTask}$deletetId/',
    );
    if (response.statusCode == 200 || response.statusCode == 202) {
      if (context.mounted) {
        AppUtils.successToast(
            message: 'Task Delete Successfully', context: context);

        context.goNamed(AppRoute.bottomNav.name);
        context.pop();
        context.pop();
      }

      return true;
    } else {
      if (context.mounted) {
        AppUtils.errorToast(message: response.body, context: context);
      }

      return false;
    }
  } catch (e) {
    return null;
  }
}

Future<bool> profileUpdateTask({
  required bool update,
  BuildContext? context,
  required String id,
}) async {
  try {
    http.Response response = await apiClient
        .putData(token: appUserToken, url: '${RemoteUrl.createTask}$id', body: {
      'completed': update,
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
