import '../entities/todo_entity.dart';

abstract class ITodoRepository {

  Future<TodoEntity> addNewTask(TodoEntity entity);

}