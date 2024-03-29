import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/create_task/provider/create_task_provider.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/services/api_client/api_client.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

final ApiClient apiClient = ApiClient();
Future<bool> createNewTask({
  required String title,
  required String description,
  required String dueDate,
  required BuildContext context,
  WidgetRef? ref,
}) async {
  try {
    http.Response response = await apiClient.postData(
        url: RemoteUrl.createTask,
        body: {
          'title': title.trim(),
          'description': description.trim(),
          'dueDate': dueDate.trim(),
        },
        token: appUserToken);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (context.mounted) {
        AppUtils.successToast(message: 'New Task created', context: context);

        context.pop();
      }

      // var responseBody = await json.decode(response.body);

      // logSmall(message: responseBody.toString());

      return true;
    } else if (response.statusCode == 400) {
      if (context.mounted) {
        ref!.read(isCreateLoadingProvider.notifier).state = false;
        AppUtils.errorToast(message: response.body, context: context);
      }
    } else {
      if (context.mounted) {
        ref!.read(isCreateLoadingProvider.notifier).state = false;
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
