import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/screens/home/state/home_screen_state.dart';

import '../../../../application/interfaces/itodo_services.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../../../components/gradient.dart';
import '../../../fonts/fonts.dart';
import '../../details_task/details_task_screen.dart';

class NextTaskComponent extends StatefulWidget {
  NextTaskComponent({Key? key, required this.todo}) : super(key: key);

  TodoEntity? todo;

  @override
  State<NextTaskComponent> createState() => _NextTaskComponentState();
}

class _NextTaskComponentState extends State<NextTaskComponent>
    with SingleTickerProviderStateMixin {
  final ITodoServices _todoServices = GetIt.instance<ITodoServices>();
  late Future<TodoEntity?> nextTodo;

  @override
  void initState() {
    nextTodo = _todoServices.getNextTaskAsync(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeScreenState controllerState = Provider.of<HomeScreenState>(context, listen: false);
    final Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        if (widget.todo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsTaskScreen(
                todoEntity: widget.todo!,
              ),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .02,
              horizontal: size.width * .04,
            ),
            decoration: BoxDecoration(
              color: Color(secondaryColor),
              gradient: gradientSuaveColors,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(size.width * .05),
                bottomLeft: Radius.circular(size.width * .05),
                topLeft: Radius.circular(size.width * .01),
                bottomRight: Radius.circular(size.width * .01),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                controllerState.nextTask == null
                    ? Container()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .025,
                              vertical: size.height * .01),
                          decoration: BoxDecoration(
                            color: Color(secondaryAlterColor),
                            borderRadius:
                                BorderRadius.circular(size.width * .01),
                          ),
                          child: Text(
                            "Próxima",
                            style: FontGoogle.dosisFont(
                              color: Colors.white,
                              letterSpacing: .5,
                              size: size.width * .04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                FutureBuilder(
                  future: nextTodo,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        {
                          return Text(
                            "Carregando tarefa...",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FontGoogle.dosisFont(
                              color: Colors.white,
                              letterSpacing: .5,
                              size: size.width * .04,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }
                      default:
                        {
                          controllerState.nextTask ??= snapshot.data;

                          if (controllerState.nextTask == null) {
                            return LayoutBuilder(
                              builder: (context, constraints) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Atualmente, você não possui tarefas pendentes. ",
                                    maxLines: 2,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: FontGoogle.dosisFont(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      size: constraints.maxWidth * .045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Explore sua agenda e comece a planejar suas tarefas!",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: FontGoogle.dosisFont(
                                      letterSpacing: .5,
                                      size: constraints.maxWidth * .04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Text(
                                controllerState.nextTask!.title,
                                style: FontGoogle.dosisFont(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  size: size.width * .05,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: size.height * .005,
                              ),
                              Text(
                                controllerState.nextTask!.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FontGoogle.dosisFont(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  size: size.width * .04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              Text(
                                DateFormat("dd/MM/yyyy HH:mm")
                                    .format(controllerState.nextTask!.dhInicio),
                                textAlign: TextAlign.right,
                                style: FontGoogle.dosisFont(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  size: size.width * .035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
