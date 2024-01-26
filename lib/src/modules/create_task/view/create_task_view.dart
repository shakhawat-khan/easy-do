import 'package:easy_do/src/components/custom_extended_button.dart';
import 'package:easy_do/src/components/date_time_picker.dart';
import 'package:easy_do/src/components/signin_signup_text.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/create_task/provider/create_task_function.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateTaskPageView extends ConsumerWidget {
  const CreateTaskPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(
            color: Color(0xFF282B31),
            fontSize: 24,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInTextTitelComponent(
                name: 'Title',
              ),
              gapH12,
              TextFormField(
                controller: ref.watch(textControllerProvider('newTaskTitle')),
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              gapH24,
              const SignInTextTitelComponent(
                name: 'Date',
              ),
              gapH12,
              TextFormField(
                controller: ref.watch(textControllerProvider('newTaskDate')),
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final date = await selectDateFromPicker(context);

                      final formattedDate =
                          DateFormat('yyyy-MM-dd').format(date!);

                      ref.watch(textControllerProvider('newTaskDate')).text =
                          formattedDate;

                      logSmall(
                        message: formattedDate,
                      );
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ),
              ),
              gapH24,
              const SignInTextTitelComponent(
                name: 'Description',
              ),
              gapH12,
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller:
                      ref.watch(textControllerProvider('newTaskDescription')),
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 100),
                      labelText: 'Description',
                      hintText: 'Description'),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () async {
                  await createNewTask(
                      context: context,
                      description: ref
                          .watch(textControllerProvider('newTaskDescription'))
                          .text,
                      dueDate:
                          ref.watch(textControllerProvider('newTaskDate')).text,
                      title: ref
                          .watch(textControllerProvider('newTaskTitle'))
                          .text);
                },
                child: const CusomExtendedButton(
                  name: 'Create Task',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
