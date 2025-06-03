import 'package:dio/dio.dart';
import 'package:task/core/constants/app_constant.dart';

class TodoDataService {
  final Dio _dio;
  TodoDataService(this._dio);

  //api call for getting all todo of user by user id
  Future<Response<dynamic>> getAllTodoByUserId(int userId) async {
    final option = RequestOptions(
      baseUrl: appBaseUrl,
      method: 'GET',
      path: '/todos/user/$userId',
    );

    return await _dio.fetch(option);
  }
}
