import 'package:flutter/material.dart';
import 'package:news/home/drawer/app_confg_item.dart';
import 'package:news/home/drawer/divider_item.dart';
import 'package:news/home/drawer/drawer_item.dart';
import 'package:news/home/drawer/language/language_bottom_sheet.dart';
import 'package:news/home/drawer/them/theme_bottom_sheet.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/utils/App_colors.dart';
import 'package:news/utils/app_images.dart';
import 'package:news/utils/app_styles.dart';
import 'package:provider/provider.dart';
class HomeDrawer extends StatefulWidget {
    final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var themProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);

    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
       Container(
         width:double.infinity,
         height: height*0.20,
         alignment: Alignment.center,
         color: AppColors.white,
         child: Text("News App",style: AppStyles.blackBold24,),
       ),
    InkWell(
            onTap: (){
              widget.onDrawerItemClick();
            },
        child: DrawerItem(iconName: AppImages.home, textName: "Go To Home")),
        DividerItem(),
        DrawerItem(iconName: AppImages.theme, textName: "Them"),
       InkWell(
         onTap: (){
           showThemeBottomSheet();
         },
         child: AppConfIgItem(name:themProvider.isDark()?'Dark':'Light',),
       ),
        SizedBox(height: height*0.02,),
        DividerItem(),
    DrawerItem(iconName: AppImages.language, textName: "Language"),
        InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: AppConfIgItem(name: languageProvider.isEnglish()?'English':'Arabic',),
        ),
      ],
    );
  }

    void showThemeBottomSheet() {
      showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet(),);
    }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context, builder: (context) => LanguageBottomSheet(),);
  }
}
