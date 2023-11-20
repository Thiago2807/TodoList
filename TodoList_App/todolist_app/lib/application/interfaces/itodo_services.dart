import 'package:flutter/material.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';

abstract class ITodoServices {
  Future addNewTask({required TextEditingController title, required TextEditingController description, required BuildContext context});

  Future<List<TodoEntity>> getTasks({required BuildContext context});

}