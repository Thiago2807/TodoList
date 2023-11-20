import '../entities/todo_entity.dart';

abstract class ITodoRepository {

  Future<TodoEntity> addNewTask(TodoEntity entity);

  Future<List<TodoEntity>> getTasks();

}