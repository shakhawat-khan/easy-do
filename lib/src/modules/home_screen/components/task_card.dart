import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final bool isComplete;
  final String datetime;
  final String dec;

  const TaskCard({
    super.key,
    required this.isComplete,
    required this.datetime,
    required this.dec,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(datetime);
    return Container(
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
                  isComplete == true
                      ? Container(
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
                      : Container(
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
                  Text(
                    DateFormat('MMMM d, yyyy').format(date),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                    child: isComplete == true
                        ? Container(
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
                        : const Text(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
