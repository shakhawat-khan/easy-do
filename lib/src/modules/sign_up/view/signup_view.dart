import 'package:easy_do/src/components/back_button.dart';
import 'package:easy_do/src/components/sign_topbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const SIgnInTopBar(),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: const CustomBackButton(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
