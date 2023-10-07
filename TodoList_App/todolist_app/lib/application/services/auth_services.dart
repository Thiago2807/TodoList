import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../../domain/DTO/auth_input_user_dto.dart';
import '../../domain/DTO/auth_register_user_dto.dart';
import '../../domain/DTO/response_server_default.dart';
import '../../domain/interfaces/iauth_repository.dart';
import '../../domain/keys/keys.dart';
import '../../presentation/colors/colors.dart';
import '../../presentation/components/scaffold_message.dart';
import '../interfaces/iauth_services.dart';
import '../preferences/auth_preferences.dart';
import '../provider/auth_provider.dart';

class AuthServices implements IAuthServices {
  final IAuthRepository _authRepository = GetIt.instance<IAuthRepository>();

  @override
  Future registerEmailUser(
      {required String email,
      required String password,
      required String nickname,
      required BuildContext context}) async {
    try {
      bool valueResponseValidInputs = _validForm(context: context, email: email, password: password, nickName: nickname);

      if (!valueResponseValidInputs) return false;

      final AuthRegisterUserDTO auth = AuthRegisterUserDTO(
          email: email, password: password, surname: nickname);

      ResponseServerDefault responseServer =
          await _authRepository.addNewUserAsync(auth);

      if (responseServer.error && context.mounted) {
        ScaffoldMessageComponent.scaffoldMessenger(
            context, redColor, responseServer.messageError);
      } else {
        Provider.of<AuthProvider>(context, listen: false).loginScreen = true;

        ScaffoldMessageComponent.scaffoldMessenger(
            context, secondaryColor, "Cadastro realizado com sucesso!");
      }
    } catch (ex) {
      ScaffoldMessageComponent.scaffoldMessenger(context, redColor,
          "Desculpe, mas não foi possível concluir o cadastro.");
    }
  }

  @override
  Future authUser(
      {required String email,
      required String password,
      required BuildContext context}) async {

    _validForm(context: context, email: email, password: password);

    AuthInputUserDTO auth = AuthInputUserDTO(email: email, password: password);

    Map<String, dynamic> response = await _authRepository.authUserAsync(auth);

    response.addAll({"password": password});

    bool responseSaved = await AuthPreferences.savedDataStringAsync(
        key: credentialsUser, content: json.encode(response));

    if (!responseSaved) {
      throw Exception("Não foi possível salvar os dados localmente.");
    }

    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil("/Home", (route) => false);
    }
  }

  bool _validForm(
      {required String email,
      required String password,
      String? nickName,
      required BuildContext context}) {

    if (!EmailValidator.validate(email)) {
      ScaffoldMessageComponent.scaffoldMessenger(context, secondaryAlterColor,
          "Por favor, insira seu e-mail e vamos embarcar juntos nessa aventura! 🚀");
      return false;
    }

    if (password == "") {
      ScaffoldMessageComponent.scaffoldMessenger(context, secondaryAlterColor,
          "Por favor, digite sua senha para que possamos continuar nossa jornada juntos! 🔐");
      return false;
    }

    if (nickName != null) {
      if (nickName == "") {
        ScaffoldMessageComponent.scaffoldMessenger(context, secondaryAlterColor,
            "Por favor, compartilhe seu apelido conosco para que possamos continuar nossa aventura juntos! 🌟");
        return false;
      }
    }

    return true;
  }
}
