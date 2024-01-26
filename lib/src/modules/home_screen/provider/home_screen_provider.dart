import 'package:easy_do/src/utils/log_message.dart';
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
