import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/features/posts/data/data_source/remote/post_data_service.dart';
import 'package:task/features/posts/data/repository_impl/post_repository_impl.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';
import 'package:task/features/posts/domain/usecases/get_all_post_by_userid_usecase.dart';
import 'package:task/features/todos/data/data_source/remote/todo_data_service.dart';
import 'package:task/features/todos/data/repository_impl/todo_repositoy_impl.dart';
import 'package:task/features/todos/domain/repositories/todo_repository.dart';
import 'package:task/features/todos/domain/usecases/get_all_todo_by_userid_usecase.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:task/features/users/data/data_source/remote/user_data_service.dart';
import 'package:task/features/users/data/repository_impl/user_repository_impl.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';
import 'package:task/features/users/domain/usecases/get_all_user_usecase.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';

final locator = GetIt.instance;

//init method
void initLocator() {
  //dio
  locator.registerSingleton<Dio>(Dio())
  // .interceptors
  // .add(
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       print("➡️ REQUEST:");
  //       print("URL: ${options.uri}");
  //       print("Method: ${options.method}");
  //       print("Headers: ${options.headers}");
  //       print("Data: ${options.data}");
  //       return handler.next(options);
  //     },
  //     onResponse: (response, handler) {
  //       print("✅ RESPONSE:");
  //       print("Status Code: ${response.statusCode}");
  //       print("Data: ${response.data}");
  //       return handler.next(response);
  //     },
  //     onError: (DioError e, handler) {
  //       print("❌ ERROR:");
  //       print("Message: ${e.message}");
  //       print("Response: ${e.response?.data}");
  //       return handler.next(e);
  //     },
  //   ),
  // )
  ;

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

  //================================= usecases ================================
  //get all user use case
  locator.registerSingleton<GetAllUserUsecase>(
    GetAllUserUsecase(locator<UserRepository>()),
  );

  //get post by user id use case
  locator.registerSingleton<GetAllPostByUseridUsecase>(
    GetAllPostByUseridUsecase(locator<PostRepository>()),
  );

  //get todo by user id usecase
  locator.registerSingleton<GetAllTodoByUseridUsecase>(
    GetAllTodoByUseridUsecase(locator<TodoRepository>()),
  );

  //=================================== blocs ===================================
  locator.registerFactory<UserBloc>(
    () => UserBloc(locator<GetAllUserUsecase>()),
  );

  locator.registerFactory<TodoBloc>(
    () => TodoBloc(locator<GetAllTodoByUseridUsecase>()),
  );
}
