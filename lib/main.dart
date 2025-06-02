import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:task/core/Routes/app_page_route.dart';
import 'package:task/dependencies.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';

void main() async {
  //initialize locator
  initLocator();

  //run app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<UserBloc>()),
        BlocProvider(create: (context) => locator<TodoBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/user-page',
      routes: AppPageRoute.routes,
    );
  }
}
