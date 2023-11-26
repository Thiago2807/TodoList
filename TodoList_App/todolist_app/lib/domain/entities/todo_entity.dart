import '../enum/status_todo_enum.dart';

class TodoEntity {
  TodoEntity({
    this.todoId,
    required this.title,
    required this.statusTodo,
    required this.description,
    required this.dhInicio,
  });

  String title;
  String? todoId;
  String description;
  StatusTodoEnum statusTodo;
  DateTime dhInicio;

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
        statusTodo: StatusTodoEnum.values[json["statusTodo"]],
        description: json["description"] as String,
        todoId: json["todoId"] as String,
        title: json["title"] as String,
        dhInicio: json["dhInicio"] as DateTime,
      );

  Map<String, dynamic> toJson() => {
        "statusTodo": statusTodo.index,
        "description": description,
        "title": title,
        "dhInicio": dhInicio.toIso8601String()
      };
}
