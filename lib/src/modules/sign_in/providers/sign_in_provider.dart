import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignInProvider extends _$SignInProvider {
  @override
  bool build() {
    return false;
  }

  void toggleValue() {
    state = !state;
  }
}
