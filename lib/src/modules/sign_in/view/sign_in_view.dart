import 'package:easy_do/main.dart';
import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/signin_signup_text.dart';

import 'package:easy_do/src/components/sign_topbar.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/home_screen/view/home_view.dart';
import 'package:easy_do/src/modules/sign_in/providers/sign_in_provider.dart';
import 'package:easy_do/src/modules/sign_in/providers/signin_function.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/key.dart';
import 'package:easy_do/src/utils/log_message.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKeySignin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SIgnInTopBar(),
                gapH24,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign in',
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
                        name: 'Email',
                      ),
                      gapH12,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: ref.watch(
                          textControllerProvider('signIn_email'),
                        ),
                        validator: (value) {
                          if (AppUtils.isValidEmail(email: value!) == false) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (AppUtils.isValidPassword(password: value!) ==
                              false) {
                            return 'password must be 7 digits';
                          }
                          return null;
                        },
                        controller: ref.watch(
                          textControllerProvider('signIn_password'),
                        ),
                        obscureText: ref.watch(signInProviderProvider),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref
                                  .read(signInProviderProvider.notifier)
                                  .toggleValue();
                            },
                            icon: ref.watch(signInProviderProvider) == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                  ),
                          ),
                        ),
                      ),
                      gapH28,
                      GestureDetector(
                        onTap: () async {
                          final isValidate =
                              formKeySignin.currentState!.validate();
                          if (isValidate == true) {
                            ref.read(isLoadingSignIn.notifier).state = true;
                            await login(
                              mail: ref
                                  .watch(
                                    textControllerProvider(
                                      'signIn_email',
                                    ),
                                  )
                                  .text,
                              pass: ref
                                  .watch(
                                    textControllerProvider(
                                      'signIn_password',
                                    ),
                                  )
                                  .text,
                              context: context,
                            );
                            ref.read(isLoadingSignIn.notifier).state = false;
                          } else {
                            const snackBar = SnackBar(
                              content:
                                  Text('Please enter valid email and password'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          // if (context.mounted) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const HomeScreen()));
                          // }
                        },
                        child: CusomExtendedButton(
                          state: ref.watch(isLoadingSignIn) == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                        ),
                      ),
                      gapH28,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF282B31),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          gapW4,
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.signUp.name);
                            },
                            child: const Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF8C88CD),
                                fontSize: 16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
