import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:task/features/users/data/models/user_model.dart';

part 'user_data_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class UserDataService {
  factory UserDataService(Dio dio) = _UserDataService;

  //api call for getalluser
  @GET('/users')
  Future<HttpResponse<List<UserModel>>> getAllUsers();
}
