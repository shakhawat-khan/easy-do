import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
              InkWell(
                onTap: () {
                  context.pushNamed(AppRoute.profileDetails.name);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Color(0xFF8C88CD)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF8C88CD)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 34,
                        ),
                      ),
                      gapW12,
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: Color(0xFF141414),
                              fontSize: 24,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          gapH8,
                          Text(
                            'john.doe@gmail.com',
                            style: TextStyle(
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
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                child: const Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.power_settings_new),
                        ),
                        SizedBox(width: 8),
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
