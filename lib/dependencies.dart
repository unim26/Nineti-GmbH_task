import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/features/posts/data/data_source/remote/post_data_service.dart';
import 'package:task/features/posts/data/repository_impl/post_repository_impl.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';
import 'package:task/features/todos/data/data_source/remote/todo_data_service.dart';
import 'package:task/features/todos/data/repository_impl/todo_repositoy_impl.dart';
import 'package:task/features/todos/domain/repositories/todo_repository.dart';
import 'package:task/features/users/data/data_source/remote/user_data_service.dart';
import 'package:task/features/users/data/repository_impl/user_repository_impl.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';

final locator = GetIt.instance;

//init method
void initLocator() {
  //dio
  locator.registerSingleton<Dio>(Dio());

  //=============================== Data services ===========================
  //user data service
  locator.registerSingleton<UserDataService>(UserDataService(locator<Dio>()));

  //post data service
  locator.registerSingleton<PostDataService>(PostDataService(locator<Dio>()));

  //todo data service
  locator.registerSingleton<TodoDataService>(TodoDataService(locator<Dio>()));

  //================================ repositoies ===============================
  //user repository
  locator.registerSingleton<UserRepository>(
    UserRepositoryImpl(locator<UserDataService>()),
  );
  //post repository
  locator.registerSingleton<PostRepository>(
    PostRepositoryImpl(locator<PostDataService>()),
  );
  //todo repository
  locator.registerSingleton<TodoRepository>(
    TodoRepositoyImpl(locator<TodoDataService>()),
  );
}
