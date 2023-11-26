import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/add_task_state.dart';

Future timerTask({required BuildContext context}) async {
  final AddTaskState stateScreen = Provider.of<AddTaskState>(context, listen: false);

  final Size size = MediaQuery.sizeOf(context);
  final ThemeData theme = Theme.of(context);

  Time timeResponse = Time(hour: 6, minute: 0);

  await Navigator.of(context).push(
    showPicker(
      context: context,
      value: (stateScreen.timeTask ?? Time(hour: 6, minute: 0)) as Time,
      sunrise: const TimeOfDay(hour: 6, minute: 0),
      sunset: const TimeOfDay(hour: 18, minute: 0),
      duskSpanInMinutes: 120,
      onChange: (value) => timeResponse = value,
      is24HrFormat: true,
      borderRadius: size.width * .02,
      accentColor: theme.primaryColor,
      blurredBackground: true,
      height: size.height * .424,
    ),
  );

  await stateScreen.addTimeTask(time: timeResponse);
}

