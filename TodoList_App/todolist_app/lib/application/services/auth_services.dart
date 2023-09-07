import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../../domain/DTO/auth_register_user_dto.dart';
import '../../domain/DTO/response_server_default.dart';
import '../../domain/interfaces/iauth_repository.dart';
import '../../presentation/colors/colors.dart';
import '../../presentation/components/scaffold_message.dart';
import '../interfaces/iauth_services.dart';
import '../provider/auth_provider.dart';

class AuthServices extends IAuthServices {

  final IAuthRepository _authRepository = GetIt.instance<IAuthRepository>();

  @override
  Future registerEmailUser({required String email, required String password, required String nickname, required BuildContext context}) async {

    if (!EmailValidator.validate(email)) return false;

    final AuthRegisterUserDTO auth = AuthRegisterUserDTO(email: email, password: password, surname: nickname);

    ResponseServerDefault responseServer = await _authRepository.addNewUserAsync(auth);

    if (responseServer.error && context.mounted) {
      ScaffoldMessageComponent.scaffoldMessenger(context, redColor, responseServer.messageError);
    }
    else {
      Provider.of<AuthProvider>(context, listen: false).loginScreen = true;

      ScaffoldMessageComponent.scaffoldMessenger(context, secondaryColor, "Cadastro realizado com sucesso!");
    }
  }
}