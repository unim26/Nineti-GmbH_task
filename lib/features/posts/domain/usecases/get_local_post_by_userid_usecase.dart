import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/domain/entities/local_post_entity.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';

class GetLocalPostByUseridUsecase
     {
  //instance of post repository
  final PostRepository _postRepository;

  //constructure
  GetLocalPostByUseridUsecase(this._postRepository);

 //method to get local posts
  DataState<List<LocalPostEntity>> call(int params) {
    return _postRepository.getLocalPostByUserId(params);
  }
}
