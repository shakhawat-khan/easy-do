import 'package:easy_do/main.dart';
import 'package:easy_do/src/services/api_client/api_client.dart';
import 'package:easy_do/src/services/api_client/api_request_type.dart';
import 'package:easy_do/src/services/api_client/multipart_file_with_name.dart';
import 'package:easy_do/src/services/api_client/remote_url.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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

Future<bool?> profilePictureUpdate(
    {required String image, BuildContext? context}) async {
  Map<String, MultipartFileWithName> filePaths = {};

  filePaths['avatar'] = MultipartFileWithName(
    filePath: image,
  );

  http.Response response = await apiClient.multipartHttpRequest(
    url: RemoteUrl.profileImage,
    apiRequestType: ApiRequestType.post,
    token: appUserToken,
    filePaths: filePaths,
  );

  if (response.statusCode == 200 || response.statusCode == 204) {
    // AppUtils.successToast(message: 'Profile Picture Update', context: context);
    logSmall(message: 'working');
    return true;
  } else {
    // AppUtils.errorToast(message: 'Profile Picture Not Update');
    logSmall(message: 'not working');
    return false;
  }
}

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.camera,
    maxHeight: 480,
    maxWidth: 640,
  );

  return image;
}
