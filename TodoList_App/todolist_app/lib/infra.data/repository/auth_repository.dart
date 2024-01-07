import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todolist_app/domain/DTO/auth_input_user_dto.dart';

import '../../domain/DTO/auth_register_user_dto.dart';
import '../../domain/DTO/response_server_default.dart';
import '../../domain/interfaces/iauth_repository.dart';

import '../url_server.dart';

class AuthRepository implements IAuthRepository {
  Dio dio = Dio(BaseOptions(baseUrl: urlServer));

  @override
  Future<ResponseServerDefault> addNewUserAsync(
      AuthRegisterUserDTO cred) async {
    Response<dynamic> responseServer = await dio.post(
      "v1/Auth/AddNewUser",
      data: json.encode(cred.toJson()),
      options: Options(validateStatus: (status) => status! < 500),
    );

    final ResponseServerDefault response =
        ResponseServerDefault(codError: 0, error: false, messageError: "");

    if (responseServer.statusCode != 201 && responseServer.statusCode != 200) {
      Map<String, dynamic> descriptionError =
          responseServer.data as Map<String, dynamic>;

      response.error = true;
      response.codError = descriptionError["codError"];
      response.messageError = descriptionError["descError"];
    }

    return response;
  }

  @override
  Future<Map<String, dynamic>> authUserAsync(AuthInputUserDTO cred) async {
    Response<dynamic> responseServer = await dio.post(
      "v1/Auth/AuthUser",
      data: json.encode(cred.toJson()),
      options: Options(validateStatus: (status) => status! < 500),
    );

    print(responseServer.statusCode);
    print(responseServer.data);

    if (responseServer.statusCode != 200) {
      throw Exception(responseServer.data);
    }

    return responseServer.data as Map<String, dynamic>;
  }


}
