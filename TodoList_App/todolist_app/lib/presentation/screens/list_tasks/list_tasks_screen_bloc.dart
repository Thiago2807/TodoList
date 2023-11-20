import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/presentation/bloc/events/list_tasks_events.dart';

import '../../bloc/states/list_tasks_states.dart';

class ListTaskBloc extends Bloc<ListTasksBaseEvent, ListTasksBaseStates> {
  ListTaskBloc() : super(AddListTaskState(listTodo: [])) {
    on<AddListTaskEvent>((event, emit) {
      emit(AddListTaskState(listTodo: event.listTodos));
    });
    on<AddItemTaskEvent>((event, emit) {
      (state as AddListTaskState).listTodo.add(event.todo);
      emit(AddListTaskState(listTodo: List.from((state as AddListTaskState).listTodo)));
    });
  }
}
