import 'package:mobx/mobx.dart';

import '../../../../domain/entities/todo_entity.dart';

part 'list_task_state.g.dart';

class ListTaskState = _ListTaskState with _$ListTaskState;

abstract class _ListTaskState with Store {

  @observable
  ObservableList<TodoEntity> listTodo = ObservableList<TodoEntity>();

  @action
  addListAsync(List<TodoEntity> list) {
    listTodo.clear();
    listTodo.addAll(list);
  }

  @action
  addItemListAsync(TodoEntity entity) {
    listTodo.add(entity);
  }

}