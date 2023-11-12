import 'package:flutter/material.dart';

abstract class ITodoServices {
  Future addNewTask({required String title, required String description, required BuildContext context});
}