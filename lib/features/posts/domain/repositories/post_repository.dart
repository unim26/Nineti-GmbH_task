import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/domain/entities/local_post_entity.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  //method to get post by userid
  Future<DataState<List<PostEntity>>> getAllPostByUserId(int userId);

  //method to get  local post by user id
  DataState<List<LocalPostEntity>> getLocalPostByUserId(int userId);

  //method to create local post
  Future<DataState<bool>> createLocalPost({String title,String body,int userId});
}
