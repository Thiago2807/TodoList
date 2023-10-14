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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * .07),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Color(secondaryAlterColor),
                      size: size.width * .07,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Nova tarefa",
                          style: FontGoogle.dosisFont(
                            color: Color(secondaryAlterColor),
                            letterSpacing: .5,
                            size: size.width * .06,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.height * .02),
          color: Color(secondaryAlterColor),
          child: Text(
            "Adicionar",
            textAlign: TextAlign.center,
            style: FontGoogle.interFont(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
          ],
        ),
      ),
    );
  }
}
