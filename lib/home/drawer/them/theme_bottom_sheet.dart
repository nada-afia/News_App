
import 'package:flutter/material.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: (){
                themeProvider.changeThem(ThemeMode.light);
                Navigator.pop(context);
              },
              child: themeProvider.appThem==ThemeMode.light?
              getSelected(themeName: 'Light'):
              getUnSelected(themeName:'Light')
          ),
          SizedBox(height: height*0.02,),
          InkWell(onTap: (){
            themeProvider.changeThem(ThemeMode.dark);
            Navigator.pop(context);
          },
              child: themeProvider.appThem==ThemeMode.dark?getSelected(themeName: 'Dark'):
              getUnSelected(themeName: 'Dark'))
        ],
      ),
    );
  }

  Widget getSelected({required String themeName }){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(themeName,style:Theme.of(context).textTheme.labelMedium,),
        Icon(Icons.check,color:Theme.of(context).cardColor,)
      ],
    );
  }
  Widget getUnSelected({required String themeName }){
    return  Text(themeName,style:Theme.of(context).textTheme.labelMedium,);
  }
}
