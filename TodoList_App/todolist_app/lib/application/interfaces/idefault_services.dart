import '../../domain/entities/user_entity.dart';

abstract class IDefaultServices {
  Future<UserEntity> getDataUserAsync();
}