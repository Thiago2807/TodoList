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

  late final _$timeTaskAtom =
      Atom(name: '_AddTaskState.timeTask', context: context);

  @override
  TimeOfDay? get timeTask {
    _$timeTaskAtom.reportRead();
    return super.timeTask;
  }

  @override
  set timeTask(TimeOfDay? value) {
    _$timeTaskAtom.reportWrite(value, super.timeTask, () {
      super.timeTask = value;
    });
  }

  late final _$dtTaskAtom =
      Atom(name: '_AddTaskState.dtTask', context: context);

  @override
  DateTime? get dtTask {
    _$dtTaskAtom.reportRead();
    return super.dtTask;
  }

  @override
  set dtTask(DateTime? value) {
    _$dtTaskAtom.reportWrite(value, super.dtTask, () {
      super.dtTask = value;
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
  dynamic addTimeTask({required TimeOfDay time}) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.addTimeTask');
    try {
      return super.addTimeTask(time: time);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addDtTask({required DateTime date}) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.addDtTask');
    try {
      return super.addDtTask(date: date);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueDrop: ${valueDrop},
timeTask: ${timeTask},
dtTask: ${dtTask}
    ''';
  }
}
