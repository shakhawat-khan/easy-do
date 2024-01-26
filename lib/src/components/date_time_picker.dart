import 'package:easy_do/src/utils/log_message.dart';
import 'package:flutter/material.dart';

Future<DateTime?> selectDateFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDateTime ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}

Future<DateTime?> selectDateTimeFromPicker(BuildContext context) async {
  DateTime? date = await selectDateFromPicker(context).then((value) async {
    if (value == null) return null;

    TimeOfDay? time = await selectTimeFromPicker(context);

    if (time == null) return null;

    return DateTime(value.year, value.month, value.day, time.hour, time.minute);
  });

  return date;
}

Future<TimeOfDay?> selectTimeFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: initialDateTime != null
        ? TimeOfDay.fromDateTime(initialDateTime)
        : TimeOfDay.now(),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}
