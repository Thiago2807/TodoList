import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/screens/add_task/component/input.dart';
import '../../fonts/fonts.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const InputAddTask(
              multiLines: false,
              textInformation: "Informe o titulo",
            ),
            SizedBox(height: size.height * .03),
            SizedBox(
              height: size.height * .16,
              child: const InputAddTask(
                multiLines: true,
                textInformation: "Informe a descrição",
              ),
            ),
            SizedBox(height: size.height * .05),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: size.height * .015),
                  backgroundColor: Color(secondaryAlterColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * .025),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Adicionar",
                    style: FontGoogle.interFont(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
