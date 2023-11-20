import '../../../domain/entities/todo_entity.dart';

abstract class ListTasksBaseEvent {}

class AddListTaskEvent extends ListTasksBaseEvent{
  List<TodoEntity> listTodos;

  AddListTaskEvent({required this.listTodos});
  
}

class AddItemTaskEvent extends ListTasksBaseEvent{
  TodoEntity todo;

  AddItemTaskEvent({required this.todo});
}