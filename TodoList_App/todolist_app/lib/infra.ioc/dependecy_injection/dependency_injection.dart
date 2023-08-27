import 'package:get_it/get_it.dart';

import '../../application/interfaces/iauth_services.dart';
import '../../application/interfaces/isplash_services.dart';
import '../../application/services/auth_services.dart';
import '../../application/services/splash_services.dart';

class DependencyInjection {
  static void setupDependencyInjection() {
    GetIt.instance.registerLazySingleton<ISplashServices>(() => SplashServices());
    GetIt.instance.registerLazySingleton<IAuthServices>(() => AuthServices());
  }
}