import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/application/interfaces/itodo_services.dart';

import '../../../../domain/entities/todo_entity.dart';
import '../../../../domain/enum/status_todo_enum.dart';
import '../../../fonts/fonts.dart';
import 'card_task.dart';

class OptionsHomeScreen extends StatefulWidget {
  const OptionsHomeScreen({
    super.key,
    required this.title,
    required this.color,
    required this.status,
  });

  final Color color;
  final String title;
  final StatusTodoEnum status;

  @override
  State<OptionsHomeScreen> createState() => _OptionsHomeScreenState();
}

class _OptionsHomeScreenState extends State<OptionsHomeScreen> {
  final ITodoServices _todoServices = GetIt.instance<ITodoServices>();

  late Future<List<TodoEntity>> _futureScreen;

  @override
  void initState() {
    _futureScreen =
        _todoServices.getTasks(context: context, status: widget.status);
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
              if (snapshot.data == null || snapshot.data!.isEmpty)
                return Container();

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
                      Text(
                        "${snapshot.data!.length.toString()} ${(snapshot.data!.length == 1 ? "Tarefa" : "Tarefas")}",
                        style: FontGoogle.interFont(
                          color: Colors.grey.shade500,
                          size: size.width * .035,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () => setState(() {
                          _futureScreen =
                              _todoServices.getTasks(context: context, status: widget.status);
                        }),
                        icon: Icon(Icons.refresh_rounded),
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
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemBuilder: (context, index) =>
                          CardTaskHomeScreen(todo: snapshot.data![index]),
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
