import 'package:easy_do/src/modules/splash/view/splash_view.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/theme/light/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Easy-do',
        theme: lightTheme,
        routerConfig: router,
      );
    });
  }
}
