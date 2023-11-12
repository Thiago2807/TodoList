import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/application/interfaces/itodo_services.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:todolist_app/domain/enum/status_todo_enum.dart';
import 'package:todolist_app/domain/interfaces/itodo_repository.dart';

class TodoServices implements ITodoServices {
  final ITodoRepository _iTodoRepository = GetIt.instance<ITodoRepository>();

  @override
  Future addNewTask(
      {required TextEditingController title,
      required TextEditingController description,
      required BuildContext context}) async {
    try {
      final TodoEntity responseTodo = await _iTodoRepository.addNewTask(
        TodoEntity(
            title: title.text,
            description: description.text,
            statusTodo: StatusTodoEnum.inProgress),
      );
    } catch (ex) {
      print(ex);
    }
  }
}
