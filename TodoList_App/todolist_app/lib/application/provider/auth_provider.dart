import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _loginScreen = true;
  bool get loginScreen => _loginScreen;
  set loginScreen (bool value) => _loginScreen = value;

  void alterScreenAuth() {

    if (_loginScreen) {
      _loginScreen = false;
    } else {
      _loginScreen = true;
    }
    notifyListeners();
  }

  bool _viewPassword = true;
  bool get viewPassword => _viewPassword;
  set viewPassword (bool value) {
    _viewPassword = value;
    notifyListeners();
  }

  bool _loadingAuth = false;
  bool get loadingAuth => _loadingAuth;
  set loadingAuth (bool value) {
    _loadingAuth = value;
    notifyListeners();
  }

}