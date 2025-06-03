import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/features/posts/data/data_source/local/post_local_data_service.dart';
import 'package:task/features/posts/data/data_source/remote/post_data_service.dart';
import 'package:task/features/posts/data/repository_impl/post_repository_impl.dart';
import 'package:task/features/posts/domain/repositories/post_repository.dart';
import 'package:task/features/posts/domain/usecases/create_local_post_usecase.dart';
import 'package:task/features/posts/domain/usecases/get_all_post_by_userid_usecase.dart';
import 'package:task/features/posts/domain/usecases/get_local_post_by_userid_usecase.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:task/features/todos/data/data_source/remote/todo_data_service.dart';
import 'package:task/features/todos/data/repository_impl/todo_repositoy_impl.dart';
import 'package:task/features/todos/domain/repositories/todo_repository.dart';
import 'package:task/features/todos/domain/usecases/get_all_todo_by_userid_usecase.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:task/features/users/data/data_source/remote/user_data_service.dart';
import 'package:task/features/users/data/repository_impl/user_repository_impl.dart';
import 'package:task/features/users/domain/repositories/user_repository.dart';
import 'package:task/features/users/domain/usecases/get_all_user_usecase.dart';
import 'package:task/features/users/domain/usecases/search_user_usecase.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';

final locator = GetIt.instance;

//init method
void initLocator() {
  // Dio
  locator.registerSingleton<Dio>(Dio());

  // ============================= Data Services =============================

  // User Data Service
  locator.registerSingleton<UserDataService>(UserDataService(locator<Dio>()));

  // Post Remote and Local Data Service
  locator.registerLazySingleton<PostDataService>(
    () => PostDataService(locator<Dio>()),
  );
  locator.registerLazySingleton<PostLocalDataService>(
    () => PostLocalDataService(),
  );

  // Todo Data Service
  locator.registerLazySingleton<TodoDataService>(
    () => TodoDataService(locator<Dio>()),
  );

  // ============================== Repositories =============================

  locator.registerSingleton<UserRepository>(
    UserRepositoryImpl(locator<UserDataService>()),
  );

  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      locator<PostDataService>(),
       locator<PostLocalDataService>(),
    ),
  );

  locator.registerLazySingleton<TodoRepository>(
    () => TodoRepositoyImpl(locator<TodoDataService>()),
  );

  // ================================ Usecases ===============================

  locator.registerSingleton<GetAllUserUsecase>(
    GetAllUserUsecase(locator<UserRepository>()),
  );

  locator.registerLazySingleton<SearchUserUsecase>(
    () => SearchUserUsecase(locator<UserRepository>()),
  );

  locator.registerLazySingleton<GetAllPostByUseridUsecase>(
    () => GetAllPostByUseridUsecase(locator<PostRepository>()),
  );

  locator.registerLazySingleton<GetLocalPostByUseridUsecase>(
    () => GetLocalPostByUseridUsecase(locator<PostRepository>()),
  );

  locator.registerLazySingleton<CreateLocalPostUsecase>(
    () => CreateLocalPostUsecase(locator<PostRepository>()),
  );

  locator.registerLazySingleton<GetAllTodoByUseridUsecase>(
    () => GetAllTodoByUseridUsecase(locator<TodoRepository>()),
  );

  // ================================ Blocs ==================================

  locator.registerFactory<UserBloc>(
    () => UserBloc(
      locator<GetAllUserUsecase>(),
      locator<SearchUserUsecase>(),
    ),
  );

  locator.registerFactory<TodoBloc>(
    () => TodoBloc(
      locator<GetAllTodoByUseridUsecase>(),
    ),
  );

  locator.registerFactory<PostBloc>(
    () => PostBloc(
      locator<GetAllPostByUseridUsecase>(),
      locator<GetLocalPostByUseridUsecase>(),
      locator<CreateLocalPostUsecase>(),
    ),
  );
}


