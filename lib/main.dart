import 'package:easy_do/src/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

String appUserToken = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain shared preferences.
  preferences = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
