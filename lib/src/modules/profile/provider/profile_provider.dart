import 'dart:typed_data';

import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/profile/model/profile_model.dart';
import 'package:easy_do/src/modules/profile/provider/profile_function.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoProvider =
    Provider<ApiServicesProfileScreen>((ref) => ApiServicesProfileScreen());

final userInfoDataProvider = FutureProvider<ProfileModel?>((ref) async {
  return ref.watch(userInfoProvider).getProfileInfo(token: appUserToken);
});

final userProfileImageProvider = FutureProvider<Uint8List?>((ref) async {
  return ref.watch(userInfoProvider).fetchImage();
});
