
import 'package:dio/dio.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/data/data_source/local/post_local_data_service.dart';
import 'package:task/features/posts/data/data_source/remote/post_data_service.dart';
import 'package:task/features/posts/data/models/post_model.dart';
import 'package:task/features/posts/domain/entities/local_post_entity.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  //instance of post data service
  final PostDataService _postDataService;
  //instance of local post data service
  final PostLocalDataService _postLocalDataService;

  //constructure
  PostRepositoryImpl(this._postDataService, this._postLocalDataService);

  //method to get all post by userid
  @override
  Future<DataState<List<PostEntity>>> getAllPostByUserId(int userId) async {
    try {
      //call api
      final response = await _postDataService.getAllPostByUserId(userId);

      //check response
      if (response.statusCode == 200) {
        final data =
            ((response.data as Map<String, dynamic>)['posts'] as List)
                .map((json) => PostModel.fromJson(json))
                .toList();
        return DataSuccess(data);
      } else {
        return DataFailed("An error occured while getting user posts");
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }

  //create local post
  @override
  Future<DataState<bool>> createLocalPost({String? title,String? body,int? userId}) async {
    try {
      //call method
       await _postLocalDataService.createLocalPost(title : title,body : body,userId : userId);

      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  //get local post by userid
  @override
  DataState<List<LocalPostEntity>> getLocalPostByUserId(int userId) {
    try {
      //call method
      final response = _postLocalDataService.getUserLocalPost(userId);

      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
