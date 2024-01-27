import 'dart:convert';

import 'package:easy_do/src/modules/home_screen/model/all_task_model.dart';
import 'package:easy_do/src/utils/api_client/remote_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider = Provider.family.autoDispose(
  (_, String __) => TextEditingController(),
);

final globalProvider = Provider((ref) => 'Global value');

final idValueProvider = StateProvider<String>((ref) => 'Initial value');

final taskValueProvider = StateProvider<Data?>((ref) => null);

final getAllTaskResponse = StateProvider<GetAllTaskModel?>((ref) => null);

final listOfTaskProvider = StateProvider<List<Data>?>((ref) => null);
