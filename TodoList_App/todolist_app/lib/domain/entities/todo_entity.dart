import '../enum/status_todo_enum.dart';

class TodoEntity {
  TodoEntity({
    this.todoId,
    required this.title,
    required this.statusTodo,
    required this.description,
  });

  String title;
  String? todoId;
  String description;
  StatusTodoEnum statusTodo;

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
        statusTodo: json["statusTodo"] as StatusTodoEnum,
        description: json["description"] as String,
        todoId: json["todoId"] as String,
        title: json["title"] as String,
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "statusTodo": statusTodo,
        "title": title,
      };
}
