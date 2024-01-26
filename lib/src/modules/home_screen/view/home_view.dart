import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/home_screen/components/task_counter.dart';
import 'package:easy_do/src/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('this is home'),
        // ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH24,
                const Text(
                  'Hello!',
                  style: TextStyle(
                    color: Color(0xFF282B31),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                gapH12,
                const Text(
                  'What\'s your plan for today ?',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                gapH28,
                const Text(
                  'Task Summary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF282B31),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                gapH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskCounter(
                      assetPath: Helpers.incompleteImage,
                      number: '12',
                      state: 'Incomplete',
                    ),
                    TaskCounter(
                        state: 'Complete',
                        assetPath: Helpers.completeImage,
                        number: '10')
                  ],
                ),
                gapH28,
                const Text(
                  'Tasks for the Day',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF282B31),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                gapH16,
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 180,
                  width: MediaQuery.sizeOf(context).width,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH12,
                          Row(
                            children: [
                              const Text(
                                'Mentorship Session',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF282B31),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 30,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFE9E9E9),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 2, color: Color(0xFF979797)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                            ],
                          ),
                          gapH8,
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.clock,
                                size: 12,
                              ),
                              gapW4,
                              const Text(
                                '20 JAN 2024',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              gapW8,
                              Container(
                                width: 90,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFFFAEC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const Text(
                                  'Incomplete',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFFBBC04),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          gapH24,
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: const Text(
                              maxLines: 2,
                              'Explore the power of our latest app feature - "Product Meeting." Effortlessly schedule and manage crucial product discussions in one central space. Collaborate seamlessly, set agenda items, and keep your team aligned for successful product development. Elevate your productivity with this intuitive feature designed to streamline your product meetings like never before.',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xFF5B5B5B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gapH16,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.green,
                    ),
                  ),
                  height: 180,
                  width: MediaQuery.sizeOf(context).width,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH12,
                          Row(
                            children: [
                              const Text(
                                'Mentorship Session',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF282B31),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 30,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF61E064),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(Icons.done, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          gapH8,
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.clock,
                                size: 12,
                              ),
                              gapW4,
                              const Text(
                                '20 JAN 2024',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              gapW8,
                              Container(
                                width: 90,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFEFFFEF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const Text(
                                  'Complete',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF61E064),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          gapH24,
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: const Text(
                              maxLines: 2,
                              'Explore the power of our latest app feature - "Product Meeting." Effortlessly schedule and manage crucial product discussions in one central space. Collaborate seamlessly, set agenda items, and keep your team aligned for successful product development. Elevate your productivity with this intuitive feature designed to streamline your product meetings like never before.',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xFF5B5B5B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapH64
              ],
            ),
          ),
        ),
      ),
    );
  }
}
