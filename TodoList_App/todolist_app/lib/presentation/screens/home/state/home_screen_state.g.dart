// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenState on _HomeScreenState, Store {
  late final _$listPriorityAtom =
      Atom(name: '_HomeScreenState.listPriority', context: context);

  @override
  ObservableList<List<TodoEntity>> get listPriority {
    _$listPriorityAtom.reportRead();
    return super.listPriority;
  }

  @override
  set listPriority(ObservableList<List<TodoEntity>> value) {
    _$listPriorityAtom.reportWrite(value, super.listPriority, () {
      super.listPriority = value;
    });
  }

  late final _$listProgressAtom =
      Atom(name: '_HomeScreenState.listProgress', context: context);

  @override
  ObservableList<List<TodoEntity>> get listProgress {
    _$listProgressAtom.reportRead();
    return super.listProgress;
  }

  @override
  set listProgress(ObservableList<List<TodoEntity>> value) {
    _$listProgressAtom.reportWrite(value, super.listProgress, () {
      super.listProgress = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeScreenState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$requestListAsyncAction =
      AsyncAction('_HomeScreenState.requestList', context: context);

  @override
  Future<dynamic> requestList(
      {required Future<List<TodoEntity>> future,
      required StatusTodoEnum status}) {
    return _$requestListAsyncAction
        .run(() => super.requestList(future: future, status: status));
  }

  late final _$restoreHomeScreenAsyncAction =
      AsyncAction('_HomeScreenState.restoreHomeScreen', context: context);

  @override
  Future<dynamic> restoreHomeScreen() {
    return _$restoreHomeScreenAsyncAction.run(() => super.restoreHomeScreen());
  }

  late final _$rechargeListProgressAsyncAction =
      AsyncAction('_HomeScreenState.rechargeListProgress', context: context);

  @override
  Future<dynamic> rechargeListProgress() {
    return _$rechargeListProgressAsyncAction
        .run(() => super.rechargeListProgress());
  }

  late final _$rechargeListPriorityAsyncAction =
      AsyncAction('_HomeScreenState.rechargeListPriority', context: context);

  @override
  Future<dynamic> rechargeListPriority() {
    return _$rechargeListPriorityAsyncAction
        .run(() => super.rechargeListPriority());
  }

  @override
  String toString() {
    return '''
listPriority: ${listPriority},
listProgress: ${listProgress},
isLoading: ${isLoading}
    ''';
  }
}
