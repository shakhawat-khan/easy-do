import 'package:easy_do/src/modules/bottom_nav/view/bottom_nav.dart';
import 'package:easy_do/src/modules/sign_in/view/sign_in_view.dart';
import 'package:easy_do/src/modules/sign_up/view/signup_view.dart';
import 'package:easy_do/src/modules/splash/view/splash_view.dart';

import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  splash,
  signIn,
  signUp,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => const BottomNavBarPage(),
    ),
    GoRoute(
      path: '/signIn',
      name: AppRoute.signIn.name,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: '/signUp',
      name: AppRoute.signUp.name,
      builder: (context, state) => const SignUpView(),
    ),
  ],
);
