import 'package:dio/dio.dart';
import 'package:task/core/constants/app_constant.dart';

class PostDataService {
  final Dio _dio;
  PostDataService(this._dio);

  //method to get all post by user id
  Future<Response<dynamic>> getAllPostByUserId(
   int userId
  ) async{
    final option = RequestOptions(baseUrl: appBaseUrl,method: 'GET',path: '/posts/user/$userId',);

return await _dio.fetch(option);

  }
}
