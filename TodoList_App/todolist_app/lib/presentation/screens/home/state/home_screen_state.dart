import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/entities/todo_entity.dart';
import '../../../../domain/enum/status_todo_enum.dart';
import '../../../../domain/interfaces/itodo_repository.dart';

part 'home_screen_state.g.dart';

class HomeScreenState = _HomeScreenState with _$HomeScreenState;

abstract class _HomeScreenState with Store {
  final ITodoRepository _iTodoRepository = GetIt.instance<ITodoRepository>();

  @observable
  ObservableList<List<TodoEntity>> listPriority = ObservableList<List<TodoEntity>>();

  @observable
  ObservableList<List<TodoEntity>> listProgress = ObservableList<List<TodoEntity>>();

  @observable
  bool isLoading = false;

  @action
  Future requestList({required Future<List<TodoEntity>> future, required StatusTodoEnum status}) async {
    final List<TodoEntity> listTodo = await future;

    if (status == StatusTodoEnum.inProgress) {
      if (listProgress.isEmpty) {
        listProgress.clear();
        listProgress.add(listTodo);
      }
    } else {
      if (listPriority.isEmpty) {
        listPriority.clear();
        listPriority.add(listTodo);
      }
    }
  }

  @action
  Future restoreHomeScreen() async {
    listProgress.clear();
    listProgress.add(await _iTodoRepository.getTasks(status: StatusTodoEnum.inProgress));

    listPriority.clear();
    listPriority.add(await _iTodoRepository.getTasks(status: StatusTodoEnum.priority));
  }

  @action
  Future rechargeListProgress() async {
    isLoading = true;
    listProgress.clear();
    listProgress.add(await _iTodoRepository.getTasks(status: StatusTodoEnum.inProgress));
    isLoading = false;
  }

  @action
  Future rechargeListPriority() async {
    isLoading = true;
    listPriority.clear();
    listPriority.add(await _iTodoRepository.getTasks(status: StatusTodoEnum.priority));
    isLoading = false;
  }

}

