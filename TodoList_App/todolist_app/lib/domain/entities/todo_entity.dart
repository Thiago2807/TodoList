import '../enum/status_todo_enum.dart';

class TodoEntity {
  TodoEntity({
    this.todoId,
    required this.title,
    required this.dhInicio,
    required this.statusTodo,
    required this.description,
  });

  String title;
  String? todoId;
  DateTime dhInicio;
  String description;
  StatusTodoEnum statusTodo;

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
        title: json["title"] as String,
        todoId: json["todoId"] as String,
        description: json["description"] as String,
        dhInicio: DateTime.parse(json["dhInicio"]),
        statusTodo: StatusTodoEnum.values[json["statusTodo"] ?? 0],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "statusTodo": statusTodo.index,
        "dhInicio": dhInicio.toIso8601String()
      };
}
