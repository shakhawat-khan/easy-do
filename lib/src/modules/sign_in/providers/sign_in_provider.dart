import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignInProvider extends _$SignInProvider {
  @override
  bool build() {
    return true;
  }

  void toggleValue() {
    state = !state;
  }
}

final isLoadingSignIn = StateProvider<bool?>((ref) => null);
