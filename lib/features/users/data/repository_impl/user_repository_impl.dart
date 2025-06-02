import 'package:dio/dio.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/users/data/data_source/remote/user_data_service.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  //instance of userdataservice
  final UserDataService _userDataService;

  //constructure
  UserRepositoryImpl(this._userDataService);

  //method to get all users
  @override
  Future<DataState<List<UserEntity>>> getAllUsers() async {
    try {
      //call api
      final data = await _userDataService.getAllUsers();

      //check response
      if (data.isNotEmpty) {
        return DataSuccess(data);
      } else {
        return DataFailed('An error occured while trying to get all users');
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }
}
