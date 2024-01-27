import 'dart:convert';

import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/utils/api_client/api_client.dart';
import 'package:easy_do/src/utils/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// get all task list
///
///
final ApiClient apiClient = ApiClient();

class ApiServicesHomeScreen {
  Future<GetAllTaskModel?> getAllTask({
    required String token,
    BuildContext? context,
  }) async {
    try {
      http.Response response = await apiClient.getData(
        url: RemoteUrl.createTask,
        token: token,
      );

      if (response.statusCode == 200) {
        return GetAllTaskModel.fromJson(jsonDecode(response.body));
      } else {
        // if (context.mounted) {
        //   AppUtils.errorToast(message: response.body, context: context);
        // }
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error to get blog by category. Exception ${e.toString()}');
      return null;
    }
  }
}

void incompleteCompleteTask({required WidgetRef ref}) {
  int incomplete = 0;
  int complete = 0;

  for (int i = 0; i < ref.read(listOfTaskProvider)!.length; i++) {
    if (ref.read(listOfTaskProvider)![i].completed == true) {
      complete++;
    } else {
      incomplete++;
    }
  }

  ref.read(incompleteTaskProvider.notifier).state = incomplete.toString();

  ref.read(completeTaskProvider.notifier).state = complete.toString();
}
