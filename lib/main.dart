import 'package:flutter/material.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';

import 'home/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => HomeScreen(),
      },
      theme: AppThem.lightMode,
    );
  }
}