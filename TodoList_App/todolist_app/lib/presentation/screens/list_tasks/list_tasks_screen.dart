import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/presentation/screens/list_tasks/state/list_task_state.dart';

import '../../../application/interfaces/itodo_services.dart';
import '../../components/card_task.dart';
import '../add_task/add_task_screen.dart';

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({super.key});

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final ITodoServices _todoServices = GetIt.instance<ITodoServices>();


  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() => setState(() {}));

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ListTaskState controllerScreen = Provider.of<ListTaskState>(context);
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddTaskScreen(),
          ),
        ),
        elevation: 2,
        backgroundColor: theme.colorScheme.secondary,
        child: Icon(
          Icons.add_rounded,
          color: theme.colorScheme.scrim,
          size: size.width * .08,
        ),
      ),
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
                    size: size.width * .07,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Minhas tarefas",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontSize: size.width * .06),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: _animationController.value,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<List<TodoEntity>>(
                future: _todoServices.getTasks(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: size.height * .0025,
                        color: theme.colorScheme.outline,
                      ),
                    );
                  } else {
                    if (snapshot.data?.isNotEmpty ?? false) {

                      controllerScreen.addListAsync(snapshot.data!);

                      return Observer(
                        builder: (context) => Flexible(
                          child: ListView.builder(
                            itemCount: controllerScreen.listTodo.length,
                            physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            itemBuilder: (context, index) =>
                                CardTask(todo: controllerScreen.listTodo[index]),
                          ),
                        ),
                      );
                    }

                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
