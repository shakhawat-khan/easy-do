import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@riverpod
class SignupPassword extends _$SignupPassword {
  @override
  bool build() {
    return true;
  }

  void toggleValue() {
    state = !state;
  }
}

@riverpod
class SignupPassworRetype extends _$SignupPassworRetype {
  @override
  bool build() {
    return true;
  }

  void toggleValue() {
    state = !state;
  }
}

final isLoadingSignUp = StateProvider<bool?>((ref) => null);
