import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/details_task/provider/details_task_function.dart';
import 'package:easy_do/src/modules/details_task/provider/details_task_provider.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../home_screen/provider/home_screen_provider.dart';

class DetailsTaskView extends ConsumerWidget {
  const DetailsTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime date = DateTime.parse(ref.watch(taskValueProvider)!.dueDate!);
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
                  Text(
                    ref.watch(taskValueProvider)!.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                  ref.watch(taskValueProvider)!.completed == true
                      ? InkWell(
                          onTap: () async {
                            ref
                                    .read(taskValueProvider.notifier)
                                    .state!
                                    .completed! ==
                                true;
                            await profileUpdateTask(
                                context: context,
                                update: false,
                                id: ref.watch(taskValueProvider)!.sId!);
                          },
                          child: Container(
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
                        )
                      : InkWell(
                          onTap: () async {
                            ref
                                    .read(taskValueProvider.notifier)
                                    .state!
                                    .completed! ==
                                true;
                            await profileUpdateTask(
                                context: context,
                                update: true,
                                id: ref.watch(taskValueProvider)!.sId!);
                          },
                          child: Container(
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
                          ),
                        )
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
                  gapW16,
                  ref.watch(taskValueProvider)!.completed == true
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
                          ))
                      : Container(
                          width: 90,
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFFAEC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
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
                            ],
                          ),
                        )
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                ref.watch(taskValueProvider)!.description!,
                                style: const TextStyle(
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
                  // logSmall(message: ref.read(idValueProvider));
                  ref.read(isDeleteTaskProvider.notifier).state = true;

                  await deleteTask(
                    deletetId: ref.read(taskValueProvider)!.sId!,
                    context: context,
                  );
                  ref.read(isDeleteTaskProvider.notifier).state = false;
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
                      child: ref.watch(isDeleteTaskProvider) == true
                          ? const Center(child: CircularProgressIndicator())
                          : const Row(
                              children: [
                                Text(
                                  'Delete Task',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                gapW4,
                                Icon(
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
