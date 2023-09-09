import '../DTO/auth_input_user_dto.dart';
import '../DTO/auth_register_user_dto.dart';
import '../DTO/response_server_default.dart';

abstract class IAuthRepository {
  Future<ResponseServerDefault> addNewUserAsync(AuthRegisterUserDTO cred);

  Future<Map<String, dynamic>> authUserAsync(AuthInputUserDTO cred);

}