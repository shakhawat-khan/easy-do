import 'package:easy_do/main.dart';
import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:easy_do/src/modules/home_screen/components/task_card.dart';
import 'package:easy_do/src/modules/home_screen/components/task_counter.dart';
import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_function.dart';
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
              FutureBuilder<GetAllTaskModel?>(
                future: getAllTask(token: appUserToken, context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data?.data?.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          isComplete: snapshot.data!.data![index].completed!,
                          datetime: snapshot.data!.data![index].dueDate!,
                          dec: snapshot.data!.data![index].description!,
                        );
                      },
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
