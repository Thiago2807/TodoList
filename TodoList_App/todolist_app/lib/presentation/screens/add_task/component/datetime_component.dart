import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/presentation/screens/add_task/component/time.dart';
import 'package:todolist_app/presentation/screens/add_task/state/add_task_state.dart';

import 'calendar.dart';

class DateTimeComponent extends StatelessWidget {
  const DateTimeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    final AddTaskState stateScreen = Provider.of<AddTaskState>(context);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async => await calendarCustom(context: context),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .01,
              horizontal: size.width * .04,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(size.width * .02),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_month_rounded),
                SizedBox(width: size.width * .02),
                Observer(
                  builder: (_) => Text(
                    stateScreen.dtTask == null
                        ? "Calendario"
                        : DateFormat("dd/MM/yyyy").format(stateScreen.dtTask!),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: size.width * .04),
        GestureDetector(
          onTap: () async => await timerTask(context: context),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .01,
              horizontal: size.width * .04,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(size.width * .02),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.alarm_rounded),
                SizedBox(width: size.width * .02),
                Observer(
                  builder: (_) => Text(
                    stateScreen.timeTask == null
                        ? "Horario"
                        : DateFormat("HH:mm").format(
                            DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              stateScreen.timeTask!.hour,
                              stateScreen.timeTask!.minute,
                            ),
                          ),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
