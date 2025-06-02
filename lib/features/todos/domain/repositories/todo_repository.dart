import 'package:task/core/resources/data_state.dart';
import 'package:task/features/todos/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  //method to call get all todo by use id
  Future<DataState<List<TodoEntity>>> getAllTodoByUserId(int userId);
}
