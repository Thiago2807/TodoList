// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTaskState on _AddTaskState, Store {
  late final _$valueDropAtom =
      Atom(name: '_AddTaskState.valueDrop', context: context);

  @override
  StatusTodoEnum get valueDrop {
    _$valueDropAtom.reportRead();
    return super.valueDrop;
  }

  @override
  set valueDrop(StatusTodoEnum value) {
    _$valueDropAtom.reportWrite(value, super.valueDrop, () {
      super.valueDrop = value;
    });
  }

  late final _$_AddTaskStateActionController =
      ActionController(name: '_AddTaskState', context: context);

  @override
  dynamic alterValueDrop(StatusTodoEnum value) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.alterValueDrop');
    try {
      return super.alterValueDrop(value);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueDrop: ${valueDrop}
    ''';
  }
}
