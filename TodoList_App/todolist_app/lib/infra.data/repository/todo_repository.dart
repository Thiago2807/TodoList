import 'dart:convert';

import 'package:todolist_app/application/dto/auth_output_user_dto.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:dio/dio.dart';

import '../../application/preferences/auth_preferences.dart';
import '../../domain/enum/status_todo_enum.dart';
import '../../domain/interfaces/itodo_repository.dart';
import '../url_server.dart';

class TodoRepository implements ITodoRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "$urlServer/v1/Todo/"));

  @override
  Future<TodoEntity> addNewTask(TodoEntity entity) async {
    final AuthOutputUserDTO user = await AuthPreferences.getUserObject();

    final Response<dynamic> responseServer = await _dio.post(
      "AddNewTask",
      data: jsonEncode(entity),
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
      ),
    );

    return TodoEntity.fromJson(responseServer.data);
  }

  @override
  Future<List<TodoEntity>> getTasks({StatusTodoEnum? status}) async {
    final AuthOutputUserDTO user = await AuthPreferences.getUserObject();

    String urlRequest = "GetListTask";

    if (status != null) {
      urlRequest += "?status=${status.index}";
    }

    final Response<dynamic> responseServer = await _dio.get(
      urlRequest,
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
      ),
    );

    List<dynamic> listData = responseServer.data as List<dynamic>;

    return listData.map((element) => TodoEntity.fromJson(element)).toList();

  }
}
