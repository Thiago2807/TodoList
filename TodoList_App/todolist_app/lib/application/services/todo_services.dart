import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/application/interfaces/itodo_services.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:todolist_app/domain/enum/status_todo_enum.dart';
import 'package:todolist_app/domain/interfaces/itodo_repository.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../presentation/components/scaffold_message.dart';
import '../../presentation/screens/list_tasks/state/list_task_state.dart';

class TodoServices implements ITodoServices {
  final ITodoRepository _iTodoRepository = GetIt.instance<ITodoRepository>();

  @override
  Future addNewTask({required TextEditingController title,
    required TextEditingController description,
    required BuildContext context}) async {
    try {
      final ListTaskState stateScreen = Provider.of<ListTaskState>(context, listen: false);

      final TodoEntity responseTodo = await _iTodoRepository.addNewTask(
        TodoEntity(
          title: title.text,
          description: description.text,
          statusTodo: StatusTodoEnum.inProgress,
        ),
      );

      if (context.mounted) {
        ScaffoldMessageComponent.scaffoldMessenger(
          context,
          greenColor,
          "Parabéns! Sua tarefa foi cadastrada com sucesso!",
        );

        await stateScreen.addItemListAsync(responseTodo);

        if (context.mounted) Navigator.pop(context);
      }

    } catch (ex) {
      if (context.mounted) {
        String msgError = "";

        if (ex is DioException) {
          msgError = ex.response?.data.toString() ?? "";
        }
        else {
          msgError =
          "A tarefa não pôde ser adicionada. Por favor, verifique as informações fornecidas e tente novamente.";
        }

        ScaffoldMessageComponent.scaffoldMessenger(
          context,
          redColor,
          msgError,
        );
      }
    }
  }

  @override
  Future<List<TodoEntity>> getTasks({required BuildContext context}) async => _iTodoRepository.getTasks();

}
