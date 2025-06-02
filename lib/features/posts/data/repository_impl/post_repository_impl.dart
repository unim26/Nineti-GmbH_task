import 'dart:io';

import 'package:dio/dio.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/data/data_source/remote/post_data_service.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  //instance of post data service
  final PostDataService _postDataService;

  //constructure
  PostRepositoryImpl(this._postDataService);

  @override
  Future<DataState<List<PostEntity>>> getAllPostByUserId(int userId) async {
    try {
      //call api
      final data = await _postDataService.getAllPostByUserId(userId);

      //check response
      if (data.isNotEmpty) {
        return DataSuccess(data);
      } else {
        return DataFailed("An error occured while getting user posts");
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }
}
