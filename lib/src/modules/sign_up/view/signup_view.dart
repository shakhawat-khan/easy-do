import 'package:easy_do/src/components/back_button.dart';
import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/sign_topbar.dart';
import 'package:easy_do/src/components/signin_signup_text.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/sign_up/providers/signup_function.dart';
import 'package:easy_do/src/modules/sign_up/providers/signup_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              gapH28,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF8C88CD),
                        fontSize: 32,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    gapH48,
                    const SignInTextTitelComponent(
                      name: 'Name',
                    ),
                    gapH12,
                    TextFormField(
                      controller: ref.watch(
                        textControllerProvider('signup_name'),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    gapH28,
                    const SignInTextTitelComponent(
                      name: 'Email',
                    ),
                    gapH12,
                    TextFormField(
                      controller: ref.watch(
                        textControllerProvider('signup_email'),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    gapH28,
                    const SignInTextTitelComponent(
                      name: 'Password',
                    ),
                    gapH12,
                    TextFormField(
                      controller: ref.watch(
                        textControllerProvider('signup_password'),
                      ),
                      obscureText: ref.watch(signupPasswordProvider),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(signupPasswordProvider.notifier)
                                .toggleValue();
                          },
                          icon: ref.watch(signupPasswordProvider) == true
                              ? const Icon(
                                  Icons.visibility_off,
                                )
                              : const Icon(
                                  Icons.visibility,
                                ),
                        ),
                      ),
                    ),
                    gapH28,
                    const SignInTextTitelComponent(
                      name: 'Retype Password',
                    ),
                    gapH12,
                    TextFormField(
                      controller: ref.watch(
                        textControllerProvider('signup_retypePassword'),
                      ),
                      obscureText: ref.watch(signupPassworRetypeProvider),
                      decoration: InputDecoration(
                          labelText: 'Retype Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref
                                  .read(signupPassworRetypeProvider.notifier)
                                  .toggleValue();
                            },
                            icon: ref.watch(signupPassworRetypeProvider) == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                  ),
                          )),
                    ),
                    gapH28,
                    GestureDetector(
                      onTap: () async {
                        await createAccount(
                            mail: ref.read(textControllerProvider('')).text,
                            name: ref
                                .read(textControllerProvider('signup_name'))
                                .text,
                            pass: ref
                                .read(textControllerProvider('signup_password'))
                                .text,
                            context: context);
                      },
                      child: const CusomExtendedButton(
                        name: 'Sign up',
                      ),
                    ),
                    gapH64,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
