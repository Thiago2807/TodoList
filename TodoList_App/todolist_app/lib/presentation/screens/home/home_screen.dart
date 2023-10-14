import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../fonts/fonts.dart';
import 'components/options.dart';
import 'components/next_task.dart';
import '../../components/gradient.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .01,
          horizontal: size.height * .03,
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Veja sua próxima tarefa",
                  style: FontGoogle.interFont(
                    color: Color(blackColor),
                    size: size.width * .04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: size.height * .01),
              const NextTaskComponent(),
              SizedBox(height: size.height * .04),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Comece a sua jornada por aqui",
                  style: FontGoogle.interFont(
                    color: Color(blackColor),
                    size: size.width * .04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: size.height * .02),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/ListTasks"),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * .02,
                      horizontal: size.width * .03),
                  decoration: BoxDecoration(
                    color: Color(secondaryColor),
                    gradient: gradientSuaveColors,
                    borderRadius: BorderRadius.circular(size.width * .02),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Tarefas Pendentes",
                              style: FontGoogle.interFont(
                                color: Colors.white,
                                size: size.width * .04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Acompanhe suas atividades pendentes",
                              style: FontGoogle.interFont(
                                color: Colors.white70,
                                size: size.width * .03,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.white,
                        size: size.width * .08,
                      )
                    ],
                  ),
                ),
              ),
              const OptionsHomeScreen(
                title: "Prioridade",
                color: Colors.deepOrange,
              ),
              const OptionsHomeScreen(
                title: "Em progresso",
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
