import 'package:easy_do/src/modules/home_screen/components/task_card.dart';
import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_provider.dart';
import 'package:easy_do/src/providers/common_providers.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Date sort Task List'),
        ),
        body: ref.watch(listOfTaskProvider) == null ||
                ref.watch(listOfTaskProvider)!.isEmpty == true
            ? const Text('No Task Found')
            : ListView.builder(
                itemCount: ref.watch(listOfTaskProvider)!.length,
                itemBuilder: (context, index) {
                  ref.watch(listOfTaskProvider.notifier).state!.sort((a, b) {
                    final dateFormat =
                        DateFormat("yyyy-MM-dd"); // Assuming your date format
                    final aDueDate = dateFormat.parse(a.dueDate ?? "");
                    final bDueDate = dateFormat.parse(b.dueDate ?? "");
                    return aDueDate.compareTo(bDueDate); // Ascending order
                  });
                  final data = ref.watch(listOfTaskProvider);
                  return GestureDetector(
                    onTap: () {
                      logSmall(message: 'message');
                    },
                    child: TaskCard(
                      isComplete: data![index].completed!,
                      datetime: data[index].dueDate!,
                      dec: data[index].description!,
                      title: data[index].title!,
                    ),
                  );
                }),
      ),
    );
  }
}
