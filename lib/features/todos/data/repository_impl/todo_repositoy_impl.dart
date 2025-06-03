import 'package:dio/dio.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/todos/data/data_source/remote/todo_data_service.dart';
import 'package:task/features/todos/data/models/todo_model.dart';
import 'package:task/features/todos/domain/entities/todo_entity.dart';
import 'package:task/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoyImpl implements TodoRepository {
  //instance of to data service
  final TodoDataService _todoDataService;

  //construcutre
  TodoRepositoyImpl(this._todoDataService);

  //method to get all todo by userid
  @override
  Future<DataState<List<TodoEntity>>> getAllTodoByUserId(int userId) async {
    try {
      //call api
      final response = await _todoDataService.getAllTodoByUserId(userId);

      //check response
      if (response.statusCode == 200) {
        final data =
            ((response.data as Map<String, dynamic>)['todos'] as List)
                .map((json) => TodoModel.fromJson(json))
                .toList();
        return DataSuccess(data);
      } else {
        return DataFailed("An error occure while getting users todo");
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }
}
