
import 'package:flutter/material.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: (){
                languageProvider.changeLanguage('en');
                Navigator.pop(context);
              },
              child: languageProvider.langCode=='en'?
              getSelected(languageName: 'English'):
              getUnSelected(themeName:'English')
          ),
          SizedBox(height: height*0.02,),
          InkWell(onTap: (){
            languageProvider.changeLanguage('ar');
            Navigator.pop(context);
          },
              child: languageProvider.langCode=='ar'?getSelected(languageName: 'Arabic'):
              getUnSelected(themeName: 'Arabic'))
        ],
      ),
    );
  }

  Widget getSelected({required String languageName }){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(languageName,style:Theme.of(context).textTheme.labelMedium,),
        Icon(Icons.check,color:Theme.of(context).cardColor,)
      ],
    );
  }
  Widget getUnSelected({required String themeName }){
    return  Text(themeName,style:Theme.of(context).textTheme.labelMedium,);
  }
}
