import 'package:flutter/material.dart';

abstract class ITodoServices {
  Future addNewTask({required TextEditingController title, required TextEditingController description, required BuildContext context});
}