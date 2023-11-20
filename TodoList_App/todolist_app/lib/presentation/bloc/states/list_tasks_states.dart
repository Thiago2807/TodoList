import '../../../domain/entities/todo_entity.dart';

abstract class ListTasksBaseStates {}

class AddListTaskState extends ListTasksBaseStates{
  List<TodoEntity> listTodo;

  AddListTaskState({required this.listTodo});

}