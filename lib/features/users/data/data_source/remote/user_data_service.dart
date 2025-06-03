import 'package:dio/dio.dart';

class UserDataService {
  final Dio _dio;
  final baseUrl = 'https://dummyjson.com/';

  UserDataService(this._dio);

  //api call for getalluser

  Future<Response<dynamic>> getAllUsers() async {
    final option = RequestOptions(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/users',
    );
    return await _dio.fetch(option);
  }

  //api for searching user
  Future<Response<dynamic>> searchUser(String query) async {
    final options = RequestOptions(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/users/search?q=$query',
    );

    return await _dio.fetch(options);
  }
}
