// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on _AuthState, Store {
  late final _$observablePasswordAtom =
      Atom(name: '_AuthState.observablePassword', context: context);

  @override
  bool get observablePassword {
    _$observablePasswordAtom.reportRead();
    return super.observablePassword;
  }

  @override
  set observablePassword(bool value) {
    _$observablePasswordAtom.reportWrite(value, super.observablePassword, () {
      super.observablePassword = value;
    });
  }

  late final _$loginScreenAtom =
      Atom(name: '_AuthState.loginScreen', context: context);

  @override
  bool get loginScreen {
    _$loginScreenAtom.reportRead();
    return super.loginScreen;
  }

  @override
  set loginScreen(bool value) {
    _$loginScreenAtom.reportWrite(value, super.loginScreen, () {
      super.loginScreen = value;
    });
  }

  late final _$loadingScreenAuthAtom =
      Atom(name: '_AuthState.loadingScreenAuth', context: context);

  @override
  bool get loadingScreenAuth {
    _$loadingScreenAuthAtom.reportRead();
    return super.loadingScreenAuth;
  }

  @override
  set loadingScreenAuth(bool value) {
    _$loadingScreenAuthAtom.reportWrite(value, super.loadingScreenAuth, () {
      super.loadingScreenAuth = value;
    });
  }

  late final _$_AuthStateActionController =
      ActionController(name: '_AuthState', context: context);

  @override
  dynamic alterObservablePassword() {
    final _$actionInfo = _$_AuthStateActionController.startAction(
        name: '_AuthState.alterObservablePassword');
    try {
      return super.alterObservablePassword();
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterLoginScreen() {
    final _$actionInfo = _$_AuthStateActionController.startAction(
        name: '_AuthState.alterLoginScreen');
    try {
      return super.alterLoginScreen();
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterLoadingScreen() {
    final _$actionInfo = _$_AuthStateActionController.startAction(
        name: '_AuthState.alterLoadingScreen');
    try {
      return super.alterLoadingScreen();
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observablePassword: ${observablePassword},
loginScreen: ${loginScreen},
loadingScreenAuth: ${loadingScreenAuth}
    ''';
  }
}
