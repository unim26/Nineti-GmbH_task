import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task/core/constants/app_constant.dart';
import 'package:task/features/posts/data/models/post_model.dart';

class PostDataService {
  final Dio _dio;
  PostDataService(this._dio);

  //method to get all post by user id
  Future<List<PostModel>> getAllPostByUserId(
   int userId
  ) async{
    final option = RequestOptions(baseUrl: appBaseUrl,method: 'GET',path: '/posts/user/$userId',);

final response = await _dio.fetch(option);

final data = response.data as Map<String,dynamic>;

return (data['posts'] as List).map((json)=> PostModel.fromJson(json)).toList();

  }
}
