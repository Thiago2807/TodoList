import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/domain/enum/status_todo_enum.dart';

import '../../../../application/interfaces/itodo_services.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../../../fonts/fonts.dart';
import 'card_task.dart';

class OptionsHomeScreen extends StatefulWidget {
  const OptionsHomeScreen({
    super.key,
    required this.title,
    required this.color,
    required this.status,
    required this.request,
    required this.listTodo,
    required this.rechargeList,
  });

  final Color color;
  final String title;
  final StatusTodoEnum status;
  final Future Function(
      {required Future<List<TodoEntity>> future,
      required StatusTodoEnum status}) request;
  final Future Function() rechargeList;
  final List<TodoEntity> listTodo;

  @override
  State<OptionsHomeScreen> createState() => _OptionsHomeScreenState();
}

class _OptionsHomeScreenState extends State<OptionsHomeScreen> {
  final ITodoServices _todoServices = GetIt.instance<ITodoServices>();
  late Future _futureScreen;

  @override
  void initState() {
    _futureScreen = widget.request(
      future: _todoServices.getTasks(
          context: context, status: widget.status),
      status: widget.status,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return FutureBuilder(
      future: _futureScreen,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            {
              return Container();
            }
          default:
            {
              final List<TodoEntity> listTodo = widget.listTodo;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: size.height * .04),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: size.width * .045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: size.width * .04),
                      Expanded(
                        child: Text(
                          "${listTodo.length.toString()} ${(listTodo.length == 1 ? "Tarefa" : "Tarefas")}",
                          style: FontGoogle.interFont(
                            color: Colors.grey.shade500,
                            size: size.width * .035,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: widget.rechargeList,
                        icon: const Icon(Icons.refresh_rounded),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: size.width * .15,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .002),
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(size.width),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .01),
                  SizedBox(
                    height: size.height * .2,
                    child: ListView.builder(
                      itemCount: listTodo.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemBuilder: (context, index) =>
                          CardTaskHomeScreen(todo: listTodo[index]),
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
