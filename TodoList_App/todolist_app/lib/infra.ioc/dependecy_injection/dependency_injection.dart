import 'package:todolist_app/domain/interfaces/iauth_repository.dart';
import 'package:get_it/get_it.dart';

import '../../application/interfaces/idefault_services.dart';
import '../../application/interfaces/isplash_services.dart';
import '../../application/interfaces/iauth_services.dart';
import '../../application/interfaces/itodo_services.dart';
import '../../application/services/default_services.dart';
import '../../application/services/todo_services.dart';
import '../../infra.data/repository/auth_repository.dart';
import '../../infra.data/repository/todo_repository.dart';
import '../../application/services/splash_services.dart';
import '../../application/services/auth_services.dart';
import '../../domain/interfaces/itodo_repository.dart';

class DependencyInjection {
  static void setupDependencyInjection() {
    // Camada de aplicação
    GetIt.instance.registerLazySingleton<IAuthServices>(() => AuthServices());
    GetIt.instance
        .registerLazySingleton<ISplashServices>(() => SplashServices());

    GetIt.instance
        .registerLazySingleton<IDefaultServices>(() => DefaultServices());

    // Camada de dados
    GetIt.instance
        .registerLazySingleton<IAuthRepository>(() => AuthRepository());

    GetIt.instance
        .registerLazySingleton<ITodoRepository>(() => TodoRepository());

    GetIt.instance
        .registerLazySingleton<ITodoServices>(() => TodoServices());
  }
}
