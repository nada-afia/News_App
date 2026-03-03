import 'package:flutter/material.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
import 'package:news/home/drawer/home_drawer.dart';
import 'package:news/home/search_screen.dart';
import 'package:news/model/category.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/utils/App_colors.dart';
import 'package:news/utils/app_images.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var themProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: HomeDrawer(onDrawerItemClick:onDrawerItemClick,),
      ),
      appBar: AppBar(
          title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(selectedCategory==null?'Home':selectedCategory!.title,),
           TextButton(onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => SearchScreen(),
               ),
             );
           }, child:Image.asset(themProvider.isDark()?AppImages.searchDark:AppImages.search)),
          ],)

      ),
      body: selectedCategory ==null?CategoryFragment(onCategoryItemClick: onCategoryItemClick,)
        :CategoryDetails(category: selectedCategory!,),
    );
  }

  Category ?selectedCategory;

  void onDrawerItemClick()
  {
    selectedCategory =null;
    Navigator.pop(context);
    setState(() {
    });
  }

  void onCategoryItemClick(Category newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });
  }
}