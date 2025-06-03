import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:task/core/App_theme/app_theme.dart';
import 'package:task/core/Routes/app_page_route.dart';
import 'package:task/core/utils/controllers/theme_controller.dart';
import 'package:task/dependencies.dart';
import 'package:task/features/posts/data/data_source/local/post_local_data_service.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';

void main() async {
  //initialize locator
  initLocator();

  //intit local post data service
  await locator<PostLocalDataService>().init();

  //run app
  runApp(
    MultiBlocProvider(
      providers: [
        //themecontroller
        ChangeNotifierProvider(create: (_) => ThemeController()),
        //user bloc
        BlocProvider(create: (context) => locator<UserBloc>()),
        //todo bloc
        BlocProvider(create: (context) => locator<TodoBloc>()),
        //post bloc
        BlocProvider(create: (context) => locator<PostBloc>()),
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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeController>().themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: '/user-page',
      routes: AppPageRoute.routes,
    );
  }
}
