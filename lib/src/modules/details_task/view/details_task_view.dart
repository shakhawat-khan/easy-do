import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/details_task/provider/details_task_function.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_provider.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home_screen/provider/home_screen_provider.dart';

class DetailsTaskView extends ConsumerWidget {
  const DetailsTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              gapH12,
              Row(
                children: [
                  const Text(
                    'Product Meeting',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF282B31),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  gapW8,
                  const Icon(
                    Icons.edit,
                    color: Colors.grey,
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
                  ),
                ],
              ),
              gapH16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.clock,
                    size: 14,
                  ),
                  gapW8,
                  const Text(
                    '20 JAN 2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  gapW16,
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
                  ),
                ],
              ),
              gapH16,
              Container(
                padding: const EdgeInsets.all(14),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282B31)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Explore the power of our latest app feature - "Product Meeting." Effortlessly schedule and manage crucial product discussions in one central space. Collaborate seamlessly, set agenda items, and keep your team aligned for successful product development. Elevate your productivity with this intuitive feature designed to streamline your product meetings like never before.',
                                style: TextStyle(
                                  color: Color(0xFF5B5B5B),
                                  fontSize: 14,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              gapH12,
              GestureDetector(
                onTap: () async {
                  logSmall(message: ref.read(taskIdProvider));

                  // await deleteTask(
                  //   deletetId: ref.read(taskIdProvider),
                  //   context: context,
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 122,
                      height: 32,
                      padding: const EdgeInsets.only(
                          top: 8, left: 14, right: 10, bottom: 8),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF808080)),
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ref.watch(taskIdProvider),
                            style: const TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          gapW4,
                          const Icon(
                            CupertinoIcons.delete_simple,
                            size: 14,
                          )
                        ],
                      ),
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
