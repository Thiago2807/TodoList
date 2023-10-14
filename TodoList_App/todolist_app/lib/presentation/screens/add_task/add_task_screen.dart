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
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .01),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.close_rounded,
                  color: Color(secondaryAlterColor),
                  size: size.width * .08,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .1, vertical: size.height * .02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Adicionar nova tarefa",
                style: FontGoogle.interFont(
                  fontWeight: FontWeight.w500,
                  size: size.width * .06,
                  color: Color(blackColor),
                ),
              ),
              SizedBox(height: size.height * .005),
              Text(
                "Adicione uma nova tarefa e organize seu dia de forma eficiente.",
                style: FontGoogle.interFont(
                  fontWeight: FontWeight.w500,
                  size: size.width * .035,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: size.height * .03),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .02,
                  horizontal: size.width * .03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.width * .03),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const InputAddTask(
                      multiLines: false,
                      textInformation: "Título",
                    ),
                    SizedBox(height: size.height * .03),
                    SizedBox(
                      height: size.height * .16,
                      child: const InputAddTask(
                        multiLines: true,
                        textInformation: "Descrição",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * .04),
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * .02),
                  decoration: BoxDecoration(
                    color: Color(secondaryAlterColor),
                    borderRadius: BorderRadius.circular(size.width * .02),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
