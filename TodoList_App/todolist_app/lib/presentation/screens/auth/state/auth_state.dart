import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store {

  @observable
  bool observablePassword = false;

  @observable
  bool loginScreen = true;

  @observable
  bool loadingScreenAuth = false;

  @action
  alterObservablePassword() {
    if (observablePassword) {
      observablePassword = false;
    } else {
      observablePassword = true;
    }
  }

  @action
  alterLoginScreen() {
    if (loginScreen) {
      loginScreen = false;
    } else {
      loginScreen = true;
    }
  }

  @action
  alterLoadingScreen() {
    if (loadingScreenAuth) {
      loadingScreenAuth = false;
    } else {
      loadingScreenAuth = true;
    }
  }

}