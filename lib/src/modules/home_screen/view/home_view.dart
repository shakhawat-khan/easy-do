import 'package:easy_do/main.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/home_screen/components/task_card.dart';
import 'package:easy_do/src/modules/home_screen/components/task_counter.dart';
import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_function.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/helpers.dart';
import 'package:easy_do/src/utils/hex_color.dart';
import 'package:easy_do/src/utils/log_message.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../home_screen/provider/home_screen_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userTaskDataProvider);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('this is home'),
        // ),

        body: Padding(
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
                    number: ref.watch(incompleteTaskProvider) == null
                        ? '0'
                        : ref.watch(incompleteTaskProvider)!,
                    state: 'Incomplete',
                  ),
                  TaskCounter(
                      state: 'Complete',
                      assetPath: Helpers.completeImage,
                      number: ref.watch(completeTaskProvider) == null
                          ? '0'
                          : ref.watch(completeTaskProvider)!)
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
              data.when(data: (data) {
                Future.delayed(const Duration(seconds: 1)).then((val) {
                  // Your logic here
                  ref.read(listOfTaskProvider.notifier).state = data!.data;
                  incompleteCompleteTask(ref: ref);
                });
                return Expanded(
                  child: ListView.builder(
                    itemCount: data!.data!.isEmpty ? 1 : data.data!.length,
                    itemBuilder: (context, index) {
                      return data.data!.isEmpty == true
                          ? const Center(child: Text('No Task Found'))
                          : InkWell(
                              onTap: () {
                                logSmall(message: 'message');

                                ref.read(taskValueProvider.notifier).state =
                                    Data(
                                        completed: data.data![index].completed!,
                                        dueDate: data.data![index].dueDate,
                                        description:
                                            data.data![index].description!,
                                        title: data.data![index].title!,
                                        sId: data.data![index].sId);

                                context
                                    .pushNamed(AppRoute.taskDetails.name)
                                    .then((value) {
                                  ref.refresh(userTaskDataProvider);
                                });
                              },
                              child: TaskCard(
                                isComplete: data.data![index].completed!,
                                datetime: data.data![index].dueDate!,
                                dec: data.data![index].description!,
                                title: data.data![index].title!,
                              ),
                            );
                    },
                  ),
                );
              }, error: (err, s) {
                return Text(s.toString());
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: HexColor('#8C88CD'),
          onPressed: () {
            context.pushNamed(AppRoute.createTask.name).then((value) {
              ref.refresh(userTaskDataProvider);
            });
          },
          label: const Text(
            'Add Task',
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            size: 24,
            color: Colors.white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
