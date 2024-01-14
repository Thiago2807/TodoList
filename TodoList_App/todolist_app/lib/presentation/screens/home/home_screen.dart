import 'package:todolist_app/presentation/screens/home/state/home_screen_state.dart';
import 'package:todolist_app/domain/enum/status_todo_enum.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../fonts/fonts.dart';
import 'components/appbar.dart';
import 'components/options.dart';
import 'components/next_task.dart';
import '../../components/gradient.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenState controllerScreen =
        Provider.of<HomeScreenState>(context);
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * .07),
        child: AppBarCustom(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .01,
          horizontal: size.height * .03,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Veja sua próxima tarefa",
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: size.width * .04,
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
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: size.width * .04,
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
              Observer(
                builder: (_) => OptionsHomeScreen(
                  title: "Prioridade",
                  color: Colors.deepOrange,
                  status: StatusTodoEnum.priority,
                  isLoading: controllerScreen.isLoading,
                  listTodo:
                      controllerScreen.listPriority.expand((x) => x).toList(),
                  request: controllerScreen.requestList,
                  rechargeList: controllerScreen.rechargeListPriority,
                ),
              ),
              Observer(
                builder: (_) => OptionsHomeScreen(
                  title: "Em progresso",
                  color: Colors.deepPurpleAccent,
                  status: StatusTodoEnum.inProgress,
                  isLoading: controllerScreen.isLoading,
                  listTodo:
                      controllerScreen.listProgress.expand((x) => x).toList(),
                  request: controllerScreen.requestList,
                  rechargeList: controllerScreen.rechargeListProgress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
