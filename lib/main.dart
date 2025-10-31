import 'package:flutter/material.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
        ChangeNotifierProvider(create: (context) => AppLanguageProvider(),)
      ],
      
      child:MyApp() ,)
      );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themProvider=Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => HomeScreen(),
      },
      theme: AppThem.lightMode,
      darkTheme: AppThem.darkMode,
      themeMode: themProvider.appThem,
    );
  }
}