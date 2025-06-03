import 'package:task/core/resources/data_state.dart';
import 'package:task/core/resources/usecase.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';

class CreateLocalPostUsecase
    implements Usecase<DataState<bool>, Map<String,dynamic>> {
  //instance of post repository
  final PostRepository _postRepository;

  //constructure
  CreateLocalPostUsecase(this._postRepository);

  @override
  Future<DataState<bool>> call(Map<String,dynamic> params) {
    return _postRepository.createLocalPost(body: params['body'],title: params['title'],userId: params['userId']);
  }
}
