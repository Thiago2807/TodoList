import 'dart:convert';

import 'package:todolist_app/domain/DTO/auth_input_user_dto.dart';

import '../../domain/DTO/auth_register_user_dto.dart';
import '../../domain/DTO/response_server_default.dart';
import '../../domain/interfaces/iauth_repository.dart';
import 'package:http/http.dart' as http;

import '../url_server.dart';

class AuthRepository extends IAuthRepository {

  @override
  Future<ResponseServerDefault> addNewUserAsync(AuthRegisterUserDTO cred) async {
    final Uri url = Uri.parse("${urlServer}v1/Auth/AddNewUser");

    http.Response responseServer = await http.post(
      url,
      body: json.encode(cred.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    final ResponseServerDefault response = ResponseServerDefault(codError: 0, error: false, messageError: "");

    if (responseServer.statusCode != 201 && responseServer.statusCode != 200){

      Map<String, dynamic> descriptionError = json.decode(responseServer.body) as Map<String, dynamic>;

      response.error = true;
      response.codError = descriptionError["codError"];
      response.messageError = descriptionError["descError"];
    }

    return response;
  }

  @override
  Future<Map<String, dynamic>> authUserAsync(AuthInputUserDTO cred) async {
    final Uri url = Uri.parse("${urlServer}v1/Auth/AuthUser");

    http.Response responseServer = await http.post(
      url,
      body: json.encode(cred.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (responseServer.statusCode != 200) {
      throw Exception(responseServer.body);
    }

    return json.decode(responseServer.body) as Map<String, dynamic>;
  }

}
