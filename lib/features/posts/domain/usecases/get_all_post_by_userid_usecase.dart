import 'package:task/core/resources/data_state.dart';
import 'package:task/core/resources/usecase.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';

class GetAllPostByUseridUsecase implements Usecase<DataState<List<PostEntity>>, int> {
  //unstance of post repository
  final PostRepository _postRepository;

  //constructure
  GetAllPostByUseridUsecase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call(int params) {
    return _postRepository.getAllPostByUserId(params);
  }
}
