import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';

class TimerTask extends StatelessWidget {
  const TimerTask({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return TextButton(
      onPressed: () async {
        final value = await Navigator.of(context).push(
          showPicker(
            context: context,
            value: Time(hour: 6, minute: 0),
            sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
            sunset: const TimeOfDay(hour: 18, minute: 0), // optional
            duskSpanInMinutes: 120, // optional
            onChange: (value) {},
            is24HrFormat: true,
            borderRadius: size.width * .02,
            accentColor: theme.primaryColor,
            blurredBackground: true,
            height: size.height * .424,
          ),
        );

        print(value.toString());
      },
      child: const Text(
        "Open time picker",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
