import 'package:dio/dio.dart';
import 'package:task/core/constants/app_constant.dart';
import 'package:task/features/todos/data/models/todo_model.dart';

class TodoDataService {
  final Dio _dio;
  TodoDataService(this._dio);

  //api call for getting all todo of user by user id
  Future<List<TodoModel>> getAllTodoByUserId(int userId  ) async{
    final option = RequestOptions(baseUrl: appBaseUrl,method: 'GET',path: '/todos/user/$userId',);

final response = await _dio.fetch(option);


final data = response.data as Map<String,dynamic>;


return (data['todos'] as List).map((json)=> TodoModel.fromJson(json)).toList();




  }
}
