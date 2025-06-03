import 'package:dio/dio.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/users/data/data_source/remote/user_data_service.dart';
import 'package:task/features/users/data/models/user_model.dart';
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
      final response = await _userDataService.getAllUsers();

      //check response
      if (response.statusCode == 200) {
        final data =
            ((response.data as Map<String, dynamic>)['users'] as List)
                .map((json) => UserModel.fromJson(json))
                .toList();
        return DataSuccess(data);
      } else {
        return DataFailed('An error occured while trying to get all users');
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }

  //method to search user
  @override
  Future<DataState<List<UserEntity>>> searchUser(String query) async {
    try {
      //call api
      final response = await _userDataService.searchUser(query);

      //check response
      if (response.statusCode == 200) {
        final data =
            ((response.data as Map<String, dynamic>)['users'] as List)
                .map((json) => UserModel.fromJson(json))
                .toList();

        return DataSuccess(data);
      } else {
        return DataFailed("An error occure while trying  to search user...!");
      }
    } on DioException catch (e) {
      return DataFailed(e.message!);
    }
  }
}
