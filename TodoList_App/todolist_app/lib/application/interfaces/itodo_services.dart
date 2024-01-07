import 'package:flutter/material.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';

import '../../domain/enum/status_todo_enum.dart';

abstract class ITodoServices {
  Future deleteTaskAsync(
      {required TodoEntity entity, required BuildContext context});

  Future<TodoEntity?> getNextTaskAsync({required BuildContext context});

  Future<List<TodoEntity>> getTasks(
      {required BuildContext context, StatusTodoEnum? status});

  Future addNewTask(
      {required TextEditingController title,
      required TextEditingController description,
      required BuildContext context,
      required StatusTodoEnum statusTodo});

  Future updateTaskAsync(
      {required TodoEntity entity, required BuildContext context});
}
