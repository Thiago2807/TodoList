import 'dart:convert';

import '../../domain/entities/user_entity.dart';
import '../../domain/keys/keys.dart';
import '../interfaces/idefault_services.dart';
import '../preferences/auth_preferences.dart';

class DefaultServices implements IDefaultServices {
  
  @override
  Future<UserEntity> getDataUserAsync() async {
    Map<String, dynamic> dataUser = jsonDecode(await AuthPreferences.getDataStringAsync(credentialsUser));

    return UserEntity.fromJson(dataUser);
  }
  
}