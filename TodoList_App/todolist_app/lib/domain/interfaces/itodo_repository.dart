import '../entities/todo_entity.dart';
import '../enum/status_todo_enum.dart';

abstract class ITodoRepository {

  Future<TodoEntity> addNewTask(TodoEntity entity);

  Future<TodoEntity> getNextTask();

  Future<List<TodoEntity>> getTasks({StatusTodoEnum? status});

}