import 'package:flutter/material.dart';
import 'package:task/features/posts/presentation/pages/create_post_page.dart';
import 'package:task/features/users/presentation/pages/user_detail_page.dart';
import 'package:task/features/users/presentation/pages/user_page.dart';

class AppPageRoute {
  static Map<String, Widget Function(BuildContext)> routes =
     <String, WidgetBuilder>{
      //user page
      '/user-page':(_)=> UserPage(),

      //user detail page
      '/user-detail-page':(_)=> UserDetailPage(),

      //create post page
      '/create-post-page':(_)=> CreatePostPage(),
    };
}
