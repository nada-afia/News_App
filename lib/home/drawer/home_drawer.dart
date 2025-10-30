import 'package:flutter/material.dart';
import 'package:news/home/drawer/app_confg_item.dart';
import 'package:news/home/drawer/divider_item.dart';
import 'package:news/home/drawer/drawer_item.dart';
import 'package:news/home/drawer/them/theme_bottom_sheet.dart';
import 'package:news/utils/App_colors.dart';
import 'package:news/utils/app_images.dart';
import 'package:news/utils/app_styles.dart';
class HomeDrawer extends StatefulWidget {
    final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
         child: AppConfIgItem(name: 'Dark',),
       ),
        SizedBox(height: height*0.02,),
        DividerItem(),
        DrawerItem(iconName: AppImages.language, textName: "Language"),
        AppConfIgItem(name: 'English',),
      ],
    );
  }

    void showThemeBottomSheet() {
      showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet(),);
    }
}
