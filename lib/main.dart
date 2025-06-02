import 'package:flutter/material.dart';
import 'package:task/core/Routes/app_page_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: AppPageRoute.routes);
  }
}
