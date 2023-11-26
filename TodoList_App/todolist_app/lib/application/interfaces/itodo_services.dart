import 'package:flutter/material.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';

import '../../domain/enum/status_todo_enum.dart';

abstract class ITodoServices {
  Future addNewTask({required TextEditingController title, required TextEditingController description, required BuildContext context, required StatusTodoEnum statusTodo});

  Future<List<TodoEntity>> getTasks({required BuildContext context, StatusTodoEnum? status});

}