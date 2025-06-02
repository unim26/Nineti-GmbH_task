import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  //method to get post by userid
  Future<DataState<List<PostEntity>>> getAllPostByUserId(int userId);
}
