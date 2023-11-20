// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_task_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListTaskState on _ListTaskState, Store {
  late final _$listTodoAtom =
      Atom(name: '_ListTaskState.listTodo', context: context);

  @override
  ObservableList<TodoEntity> get listTodo {
    _$listTodoAtom.reportRead();
    return super.listTodo;
  }

  @override
  set listTodo(ObservableList<TodoEntity> value) {
    _$listTodoAtom.reportWrite(value, super.listTodo, () {
      super.listTodo = value;
    });
  }

  late final _$_ListTaskStateActionController =
      ActionController(name: '_ListTaskState', context: context);

  @override
  dynamic addListAsync(List<TodoEntity> list) {
    final _$actionInfo = _$_ListTaskStateActionController.startAction(
        name: '_ListTaskState.addListAsync');
    try {
      return super.addListAsync(list);
    } finally {
      _$_ListTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemListAsync(TodoEntity entity) {
    final _$actionInfo = _$_ListTaskStateActionController.startAction(
        name: '_ListTaskState.addItemListAsync');
    try {
      return super.addItemListAsync(entity);
    } finally {
      _$_ListTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTodo: ${listTodo}
    ''';
  }
}
