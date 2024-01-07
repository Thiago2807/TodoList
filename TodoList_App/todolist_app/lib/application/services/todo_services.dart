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
import 'package:todolist_app/presentation/screens/add_task/state/add_task_state.dart';

import '../../presentation/components/alert_dialog.dart';
import '../../presentation/components/scaffold_message.dart';
import '../../presentation/screens/home/state/home_screen_state.dart';
import '../../presentation/screens/list_tasks/state/list_task_state.dart';

class TodoServices implements ITodoServices {
  final ITodoRepository _iTodoRepository = GetIt.instance<ITodoRepository>();

  @override
  Future addNewTask({
    required BuildContext context,
    required StatusTodoEnum statusTodo,
    required TextEditingController title,
    required TextEditingController description,
  }) async {
    try {
      final HomeScreenState homeControllerScreen =
          Provider.of<HomeScreenState>(context, listen: false);

      final ListTaskState stateScreen =
          Provider.of<ListTaskState>(context, listen: false);

      final AddTaskState stateScreenAddTask =
          Provider.of<AddTaskState>(context, listen: false);

      DateTime dtTask = DateTime(
        stateScreenAddTask.dtTask!.year,
        stateScreenAddTask.dtTask!.month,
        stateScreenAddTask.dtTask!.day,
        stateScreenAddTask.timeTask!.hour,
        stateScreenAddTask.timeTask!.minute,
      );

      final TodoEntity responseTodo = await _iTodoRepository.addNewTask(
        TodoEntity(
          dhInicio: dtTask,
          title: title.text,
          statusTodo: statusTodo,
          description: description.text,
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

      await homeControllerScreen.restoreHomeScreen();
    } catch (ex) {
      if (context.mounted) {
        String msgError = "";

        if (ex is DioException) {
          msgError = ex.response?.data.toString() ?? "";
        } else {
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
  Future<List<TodoEntity>> getTasks(
      {required BuildContext context, StatusTodoEnum? status}) async {
    try {
      return _iTodoRepository.getTasks(status: status);
    } catch (ex) {
      if (context.mounted) {
        String msgError = "";

        if (ex is DioException) {
          msgError = ex.response?.data.toString() ?? "";
        } else {
          msgError =
              "A tarefa não pôde ser adicionada. Por favor, verifique as informações fornecidas e tente novamente.";
        }

        ScaffoldMessageComponent.scaffoldMessenger(
          context,
          redColor,
          msgError,
        );
      }
      return [];
    }
  }

  @override
  Future<TodoEntity?> getNextTaskAsync({required BuildContext context}) async {
    try {
      return _iTodoRepository.getNextTask();
    } catch (ex) {
      if (context.mounted) {
        String msgError = "";

        if (ex is DioException) {
          msgError = ex.response?.data.toString() ?? "";
        } else {
          msgError =
              "A tarefa não pôde ser adicionada. Por favor, verifique as informações fornecidas e tente novamente.";
        }

        ScaffoldMessageComponent.scaffoldMessenger(
          context,
          redColor,
          msgError,
        );
      }
      return null;
    }
  }

  @override
  Future deleteTaskAsync(
      {required TodoEntity entity, required BuildContext context}) async {
    try {
      final ListTaskState controllerScreen =
          Provider.of<ListTaskState>(context, listen: false);

      final HomeScreenState homeControllerScreen =
          Provider.of<HomeScreenState>(context, listen: false);

      showDialog(
        context: context,
        builder: (context) => AlertDialogComponent(
          title: "Excluir tarefa",
          content: "Você realmente deseja excluir essa tarefa?",
          functionAction: () async {
            await _iTodoRepository.deleteTaskAsync(idTask: entity.todoId!);

            controllerScreen.listTodo.remove(entity);

            if (context.mounted) Navigator.pop(context);

            if (context.mounted) {
              ScaffoldMessageComponent.scaffoldMessenger(
                context,
                greenColor,
                "Tarefa removida com sucesso",
              );
            }

            await homeControllerScreen.restoreHomeScreen();
          },
        ),
      );
    } catch (ex) {
      if (context.mounted) {
        String msgError = "";

        if (ex is DioException) {
          msgError = ex.response?.data.toString() ?? "";
        } else {
          msgError =
              "Não foi possível remover a tarefa, tente novamente mais tarde.";
        }

        ScaffoldMessageComponent.scaffoldMessenger(
          context,
          redColor,
          msgError,
        );
      }
    }
  }
}
