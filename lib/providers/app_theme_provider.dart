import 'package:flutter/material.dart';
class AppThemeProvider extends ChangeNotifier{
  ThemeMode appThem=ThemeMode.light;
  void changeThem(ThemeMode newThem){
    if(appThem==newThem){
      return;
    }
    appThem=newThem;
    notifyListeners();
  }
  bool isDark(){
    return appThem == ThemeMode.dark;
  }
}