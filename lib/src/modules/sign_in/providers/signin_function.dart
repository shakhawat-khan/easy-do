import 'dart:convert';

import 'package:easy_do/main.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/services/api_client/api_client.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

final ApiClient apiClient = ApiClient();
Future<bool> login(
    {required String mail,
    required String pass,
    required BuildContext context}) async {
  try {
    http.Response response = await apiClient.postData(
      url: RemoteUrl.loginUrl,
      body: {
        'email': mail.trim(),
        'password': pass.trim(),
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (context.mounted) {
        appUserToken = preferences.getString('token') ?? '';
        AppUtils.successToast(message: 'Login Successful', context: context);

        final parsedJson = jsonDecode(response.body) as Map<String, dynamic>;
        final token = parsedJson['token'];
        final userId = parsedJson['user']['_id'];

        logSmall(message: userId);
        logSmall(message: token);

        preferences.setString('token', token);
        preferences.setString('userId', userId);
        appUserToken = preferences.getString('token') ?? '';
        appUserId = preferences.getString('userId') ?? '';
        logSmall(message: appUserId);
        context.goNamed(AppRoute.bottomNav.name);
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
