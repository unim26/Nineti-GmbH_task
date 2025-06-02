import 'package:dio/dio.dart';
import 'package:task/features/users/data/models/user_model.dart';


 class UserDataService {
  final Dio _dio;
  final baseUrl = 'https://dummyjson.com/';

   UserDataService( this._dio);

  //api call for getalluser

  Future<List<UserModel>> getAllUsers() async{
    final option = RequestOptions(baseUrl: baseUrl,method: 'GET',path: '/users',);
    final response = await _dio.fetch(option);

    final data = response.data as Map<String,dynamic>;

    return (data['users'] as List).map((json)=> UserModel.fromJson(json)).toList();
  }
}
