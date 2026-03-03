import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier{
  String langCode = 'en';
  void changeLanguage(String newLang) {
    if (langCode == newLang) {
     return;
    }
    langCode=newLang;
      notifyListeners();
    }
  bool isEnglish(){
    return langCode == 'en';
  }
  }

