import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/enum/status_todo_enum.dart';

part 'add_task_state.g.dart';

class AddTaskState = _AddTaskState with _$AddTaskState;

abstract class _AddTaskState with Store {

  @observable
  StatusTodoEnum valueDrop = StatusTodoEnum.activated;

  @observable
  TimeOfDay? timeTask;

  @observable
  DateTime? dtTask;

  @action
  alterValueDrop(StatusTodoEnum value) {
    valueDrop = value;
  }

  @action
  addTimeTask({required TimeOfDay time}) {
    timeTask = time;
  }

  @action
  addDtTask({required DateTime date}) {
    dtTask = date;
  }

}