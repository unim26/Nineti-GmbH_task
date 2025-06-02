import 'package:task/core/resources/data_state.dart';
import 'package:task/core/resources/usecase.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';

class GetAllUserUsecase implements Usecase<DataState<List<UserEntity>>, Null> {
  //instance of user repository
  final UserRepository _userRepository;

  //constructure
  GetAllUserUsecase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call(Null params) {
    return _userRepository.getAllUsers();
  }
}
