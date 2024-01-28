import 'package:easy_do/src/components/back_button.dart';
import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/sign_topbar.dart';
import 'package:easy_do/src/components/signin_signup_text.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/sign_up/providers/signup_function.dart';
import 'package:easy_do/src/modules/sign_up/providers/signup_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/utils/app_utils.dart';
import 'package:easy_do/src/utils/key.dart';
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
          child: Form(
            key: formKeySignup,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (AppUtils.isValidEmail(email: value!) == false) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (AppUtils.isValidPassword(password: value!) ==
                              false) {
                            return 'Invalid Password';
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (AppUtils.isValidPassword(password: value!) ==
                              false) {
                            return 'Invalid Password';
                          }
                          return null;
                        },
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
                              icon:
                                  ref.watch(signupPassworRetypeProvider) == true
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(
                                          Icons.visibility,
                                        ),
                            )),
                      ),
                      gapH28,
                      GestureDetector(
                        onTap: () async {
                          final isValidate =
                              formKeySignin.currentState!.validate();

                          if (isValidate == true &&
                              ref
                                      .read(textControllerProvider(
                                          'signup_password'))
                                      .text ==
                                  ref
                                      .read(textControllerProvider(
                                          'signup_retypePassword'))
                                      .text) {
                            ref.read(isLoadingSignUp.notifier).state = true;
                            await createAccount(
                                mail: ref
                                    .read(
                                        textControllerProvider('signup_email'))
                                    .text,
                                name: ref
                                    .read(textControllerProvider('signup_name'))
                                    .text,
                                pass: ref
                                    .read(textControllerProvider(
                                        'signup_password'))
                                    .text,
                                context: context);
                            ref.read(isLoadingSignUp.notifier).state = false;
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                  'Please enter valid email and password or password missmatch'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: CusomExtendedButton(
                          state: ref.watch(isLoadingSignUp) == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Sign Up',
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
                      gapH64,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
