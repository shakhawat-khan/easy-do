import 'package:easy_do/src/modules/bottom_nav/view/bottom_nav.dart';
import 'package:easy_do/src/modules/create_task/view/create_task_view.dart';
import 'package:easy_do/src/modules/details_task/view/details_task_view.dart';
import 'package:easy_do/src/modules/home_screen/view/home_view.dart';
import 'package:easy_do/src/modules/profile_details/view/profile_details_view.dart';
import 'package:easy_do/src/modules/sign_in/view/sign_in_view.dart';
import 'package:easy_do/src/modules/sign_up/view/signup_view.dart';
import 'package:easy_do/src/modules/splash/view/splash_view.dart';

import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  splash,
  signIn,
  signUp,
  createTask,
  taskDetails,
  bottomNav,
  profileDetails
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashScreen(),
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
    GoRoute(
      path: '/createTask',
      name: AppRoute.createTask.name,
      builder: (context, state) => const CreateTaskPageView(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/taskDetails',
      name: AppRoute.taskDetails.name,
      builder: (context, state) => const DetailsTaskView(),
    ),
    GoRoute(
      path: '/bottomNav',
      name: AppRoute.bottomNav.name,
      builder: (context, state) => const BottomNavBarPage(),
    ),
    GoRoute(
      path: '/profileDetails',
      name: AppRoute.profileDetails.name,
      builder: (context, state) => const ProfileDetailsView(),
    )
  ],
);
