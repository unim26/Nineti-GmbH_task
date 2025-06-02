import 'package:task/core/resources/data_state.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  //method to get all users
  Future<DataState<List<UserEntity>>> getAllUsers();
}
