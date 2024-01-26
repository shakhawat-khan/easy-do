import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider = Provider.family.autoDispose(
  (_, String __) => TextEditingController(),
);
