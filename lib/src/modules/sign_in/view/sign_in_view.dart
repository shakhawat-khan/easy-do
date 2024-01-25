import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/signIn_signUp_text.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/utils/hex_color.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 180,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash_color.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                ),
                child: const Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/splash_logo.png')),
                  ),
                ),
              ),
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
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    gapH28,
                    const CusomExtendedButton(name: 'Sign in'),
                    gapH28,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
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
                        Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8C88CD),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            height: 0,
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
    );
  }
}
