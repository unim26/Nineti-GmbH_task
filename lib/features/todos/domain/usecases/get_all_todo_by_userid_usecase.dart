import 'package:task/core/resources/data_state.dart';
import 'package:task/core/resources/usecase.dart';
import 'package:task/features/todos/domain/entities/todo_entity.dart';
import 'package:task/features/todos/domain/repositories/todo_repository.dart';

class GetAllTodoByUseridUsecase
    implements Usecase<DataState<List<TodoEntity>>, int> {
  //todo repository
  final TodoRepository _todoRepository;

  //construcuter
  GetAllTodoByUseridUsecase(this._todoRepository);

  @override
  Future<DataState<List<TodoEntity>>> call(int params) {
    return _todoRepository.getAllTodoByUserId(params);
  }
}
