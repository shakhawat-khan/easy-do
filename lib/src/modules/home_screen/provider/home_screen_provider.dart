import 'package:easy_do/main.dart';
import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/modules/home_screen/provider/home_screen_function.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_provider.g.dart';

@riverpod
class TaskId extends _$TaskId {
  @override
  String build() {
    return 'gg';
  }

  void deleteId(String id) {
    state = id;
  }
}

final incompleteTaskProvider = StateProvider<String?>((ref) => null);

final completeTaskProvider = StateProvider<String?>((ref) => null);

final userTaskProvider =
    Provider<ApiServicesHomeScreen>((ref) => ApiServicesHomeScreen());

final userTaskDataProvider = FutureProvider<GetAllTaskModel?>((ref) async {
  return ref.watch(userTaskProvider).getAllTask(token: appUserToken);
});
