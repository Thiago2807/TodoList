import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../state/add_task_state.dart';

Future calendarCustom({required BuildContext context}) async {
  final AddTaskState stateScreen =
      Provider.of<AddTaskState>(context, listen: false);

  final Size size = MediaQuery.sizeOf(context);
  final ThemeData theme = Theme.of(context);

  final DateRangePickerController _controller = DateRangePickerController();

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                backgroundColor: theme.colorScheme.scrim,
                child: Icon(
                  Icons.close_rounded,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .1),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height * .5,
              width: size.width,
              child: Container(
                padding: EdgeInsets.all(size.width * .02),
                decoration: BoxDecoration(
                  color: theme.colorScheme.scrim,
                  borderRadius: BorderRadius.circular(size.width * .02),
                ),
                child: SfDateRangePicker(
                  initialSelectedDate: stateScreen.dtTask ?? DateTime.now(),
                  allowViewNavigation: true,
                  controller: _controller,
                  minDate: DateTime.now(),
                  selectionColor: Color(secondaryAlterColor),
                  backgroundColor: theme.colorScheme.scrim,
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: theme.textTheme.displaySmall,
                    disabledDatesTextStyle: theme.textTheme.bodySmall,
                    todayTextStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .1),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Confirmar",
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    ),
  );

  if (_controller.selectedDate == null) {
    throw Exception("");
  }

  await stateScreen.addDtTask(date: _controller.selectedDate!);
}
