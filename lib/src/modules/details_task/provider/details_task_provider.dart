import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/create_task/provider/create_task_function.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_function.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final isDeleteTaskProvider = StateProvider<bool?>((ref) => null);




// final userUpdateTaskProvider =
//     Provider<ApiServicesHomeScreen>((ref) => ApiServicesHomeScreen());

// final userDataUpdateProvider = FutureProvider<GetAllTaskModel?>((ref) async {
//   return ref.watch(userUpdateTaskProvider).getAllTask(token: appUserToken);
// });