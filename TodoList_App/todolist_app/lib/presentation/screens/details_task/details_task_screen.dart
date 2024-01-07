import 'package:todolist_app/presentation/screens/add_task/add_task_screen.dart';
import 'package:todolist_app/domain/enum/status_todo_enum.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../../application/interfaces/itodo_services.dart';
import '../../components/gradient.dart';
import '../../colors/colors.dart';
import '../../fonts/fonts.dart';

class DetailsTaskScreen extends StatefulWidget {
  const DetailsTaskScreen({
    super.key,
    required this.todoEntity,
  });

  final TodoEntity todoEntity;

  @override
  State<DetailsTaskScreen> createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen>
    with SingleTickerProviderStateMixin {
  final ITodoServices _iTodoServices = GetIt.instance<ITodoServices>();
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addStatusListener((status) => setState(() {}));

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

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
                  size: size.width * .08,
                ),
              ),
            ),
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: animationController.value,
        duration: const Duration(milliseconds: 250),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * .05),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(size.width * .03),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * .01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(size.width * .03),
                              topLeft: Radius.circular(size.width * .01),
                            ),
                            gradient: gradientSuaveColors,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(1, 2),
                                color: Colors.black12,
                              )
                            ],
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _nameStatus(widget.todoEntity.statusTodo),
                                      textAlign: TextAlign.center,
                                      style: FontGoogle.interFont(
                                        fontWeight: FontWeight.w500,
                                        size: size.width * .035,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _iTodoServices.deleteTaskAsync(
                                        entity: widget.todoEntity,
                                        context: context,
                                        twoPop: true,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: constraints.maxWidth * .02),
                                      child: Icon(
                                        color: Colors.white,
                                        size: constraints.maxWidth * .06,
                                        Icons.delete_outline_rounded,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .02,
                          horizontal: size.width * .03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              widget.todoEntity.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: constraints.maxWidth * .06,
                              ),
                            ),
                            SizedBox(height: size.height * .01),
                            Text(
                              widget.todoEntity.description,
                              style: FontGoogle.interFont(
                                fontWeight: FontWeight.w500,
                                size: size.width * .035,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(height: size.height * .02),
                            Text(
                              DateFormat("dd/MM/yyyy HH:mm")
                                  .format(widget.todoEntity.dhInicio),
                              textAlign: TextAlign.right,
                              style: FontGoogle.interFont(
                                fontWeight: FontWeight.w500,
                                size: size.width * .035,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: size.height * .02),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTaskScreen(
                        todo: widget.todoEntity,
                        isEditing: true,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * .02),
                  decoration: BoxDecoration(
                    color: Color(secondaryAlterColor),
                    borderRadius: BorderRadius.circular(size.width * .02),
                  ),
                  child: Text(
                    "Editar Tarefa",
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

  String _nameStatus(StatusTodoEnum status) {
    switch (status) {
      case StatusTodoEnum.priority:
        return "Prioridade";
      case StatusTodoEnum.activated:
        return "Ativado";
      case StatusTodoEnum.finished:
        return "Finalizado";
      default:
        return "Em progresso";
    }
  }
}
