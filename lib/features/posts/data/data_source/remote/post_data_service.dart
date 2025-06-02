

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:task/features/posts/data/models/post_model.dart';

part 'post_data_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class PostDataService {
  factory PostDataService(Dio dio) = _PostDataService;

  //method to get all post by user id
  @GET('/posts/user/{userId}')
  Future<HttpResponse<List<PostModel>>> getAllPostByUserId(
    @Path("userId") int userId,
  );
}
