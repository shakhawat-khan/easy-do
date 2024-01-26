import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/bottom_nav/view/bottom_nav.dart';
import 'package:easy_do/src/modules/home_screen/view/home_view.dart';
import 'package:easy_do/src/modules/sign_in/view/sign_in_view.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      // context.pushReplacementNamed(AppRoute.signIn.name);
      if (preferences.getString('token') == null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInView()));
      } else {
        appUserToken = preferences.getString('token') ?? '';
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BottomNavBarPage()));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Helpers.splashColor),
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage(
                Helpers.splashLogo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
