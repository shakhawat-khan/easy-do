import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/signin_signup_text.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/profile_details/provider/profile_details_function.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetailsView extends ConsumerWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile Details'),
          ),
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Helpers.splashColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 80, // Adjust radius as needed
                              backgroundColor:
                                  Colors.black, // Set the background color
                              backgroundImage: AssetImage(Helpers.demoUser),
                            ),
                            const Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    gapH24,
                    const SignInTextTitelComponent(
                      name: 'Name',
                    ),
                    gapH12,
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      controller: ref.watch(
                        textControllerProvider('profile_name'),
                      ),
                    ),
                    gapH16,
                    const SignInTextTitelComponent(
                      name: 'Email',
                    ),
                    gapH12,
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      controller: ref.watch(
                        textControllerProvider('profile_email'),
                      ),
                    ),
                    gapH16,
                    const SignInTextTitelComponent(
                      name: 'Age',
                    ),
                    gapH12,
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Age'),
                      controller: ref.watch(
                        textControllerProvider('profile_age'),
                      ),
                    ),
                    gapH24,
                    GestureDetector(
                      onTap: () async {
                        await profileUpdate(
                          context: context,
                          age: ref
                              .read(textControllerProvider('profile_age'))
                              .text,
                          email: ref
                              .read(textControllerProvider('profile_email'))
                              .text,
                          name: ref
                              .read(textControllerProvider('profile_name'))
                              .text,
                        );
                      },
                      child: const CusomExtendedButton(
                        state: Text(
                          'Update',
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
