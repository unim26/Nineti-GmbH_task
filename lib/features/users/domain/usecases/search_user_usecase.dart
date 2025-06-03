import 'package:task/core/resources/data_state.dart';
import 'package:task/core/resources/usecase.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';

class SearchUserUsecase
    implements Usecase<DataState<List<UserEntity>>, String> {
  //user repository
  final UserRepository _userRepository;

  //constructure
  SearchUserUsecase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call(String params) {
    return _userRepository.searchUser(params);
  }
}
