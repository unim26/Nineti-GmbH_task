import 'package:flutter/material.dart';
import 'package:task/features/users/presentation/pages/user_page.dart';

class AppPageRoute {
  static Map<String, Widget Function(BuildContext)> routes =
     <String, WidgetBuilder>{
      //user page
      '/user-page':(_)=> UserPage(),
    };
}
