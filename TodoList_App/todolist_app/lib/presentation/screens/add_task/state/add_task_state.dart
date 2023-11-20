import 'package:mobx/mobx.dart';

import '../../../../domain/enum/status_todo_enum.dart';

part 'add_task_state.g.dart';

class AddTaskState = _AddTaskState with _$AddTaskState;

abstract class _AddTaskState with Store {

  @observable
  StatusTodoEnum valueDrop = StatusTodoEnum.activated;

  @action
  alterValueDrop(StatusTodoEnum value) {
    valueDrop = value;
  }

}