import 'package:easy_do/main.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/profile/provider/profile_function.dart';
import 'package:easy_do/src/modules/profile/provider/profile_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/helpers.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(userInfoDataProvider);
    final profileImage = ref.watch(userProfileImageProvider);
    // final listOfProfileData =
    //     ref.watch(listOfProfiledataProvider.notifier).state;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              profileData.when(data: (data) {
                return InkWell(
                  onTap: () {
                    ref.watch(textControllerProvider('profile_name')).text =
                        data.name!;

                    ref.watch(textControllerProvider('profile_email')).text =
                        data.email!;

                    ref
                        .watch(
                          textControllerProvider('profile_age'),
                        )
                        .text = data.age!.toString();

                    // listOfProfileData!.email = data.email;

                    context
                        .pushNamed(AppRoute.profileDetails.name)
                        .then((value) {
                      ref.refresh(userInfoDataProvider);
                      ref.refresh(userProfileImageProvider);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2, color: Color(0xFF8C88CD)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        profileImage.when(data: (data) {
                          Future.delayed(const Duration(seconds: 1))
                              .then((val) {
                            // Your logic here
                            if (data != null) {
                              ref
                                  .read(profileImageUnitListProvider.notifier)
                                  .state = data;
                            }
                          });

                          return Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(data!),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFF8C88CD),
                              ),
                            ),
                          );
                        }, error: (err, s) {
                          return CircleAvatar(
                            radius: 30, // Adjust radius as needed
                            backgroundColor:
                                Colors.black, // Set the background color
                            backgroundImage: AssetImage(Helpers.demoUser),
                          );
                        }, loading: () {
                          return const CircularProgressIndicator();
                        }),
                        gapW12,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                data!.name!,
                                maxLines: 1,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xFF141414),
                                  fontSize: 18,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            gapH8,
                            Text(
                              data.email!,
                              style: const TextStyle(
                                color: Color(0xFF9599A2),
                                fontSize: 14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(CupertinoIcons.arrow_right)),
                      ],
                    ),
                  ),
                );

                // Text(
                //   data!.age.toString(),
                // );
              }, loading: () {
                return const CircularProgressIndicator();
              }, error: (err, s) {
                return Text(s.toString());
              }),

              // InkWell(
              //   onTap: () {
              //     context.pushNamed(AppRoute.profileDetails.name);
              //   },
              //   child: Container(
              //     width: MediaQuery.sizeOf(context).width,
              //     height: 80,
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              //     decoration: ShapeDecoration(
              //       color: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         side:
              //             const BorderSide(width: 2, color: Color(0xFF8C88CD)),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           width: 60,
              //           height: 60,
              //           decoration: ShapeDecoration(
              //             shape: RoundedRectangleBorder(
              //               side: const BorderSide(
              //                   width: 1, color: Color(0xFF8C88CD)),
              //               borderRadius: BorderRadius.circular(100),
              //             ),
              //           ),
              //           child: const Icon(
              //             Icons.person,
              //             size: 34,
              //           ),
              //         ),
              //         gapW12,
              //         const Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'John Doe',
              //               style: TextStyle(
              //                 color: Color(0xFF141414),
              //                 fontSize: 24,
              //                 fontFamily: 'Manrope',
              //                 fontWeight: FontWeight.w700,
              //                 height: 0,
              //               ),
              //             ),
              //             gapH8,
              //             Text(
              //               'john.doe@gmail.com',
              //               style: TextStyle(
              //                 color: Color(0xFF9599A2),
              //                 fontSize: 14,
              //                 fontFamily: 'Manrope',
              //                 fontWeight: FontWeight.w500,
              //                 height: 0,
              //               ),
              //             )
              //           ],
              //         ),
              //         const Spacer(),
              //         const SizedBox(
              //             width: 24,
              //             height: 24,
              //             child: Icon(CupertinoIcons.arrow_right)),
              //       ],
              //     ),
              //   ),
              // ),

              InkWell(
                onTap: () async {
                  logSmall(message: 'message');
                  preferences.setString('token', '');
                  context.pushReplacementNamed(AppRoute.signIn.name);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(Icons.power_settings_new),
                      ),
                      gapW8,
                      Column(
                        children: [
                          Text(
                            'Log Out',
                            style: TextStyle(
                              color: Color(0xFF141414),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
