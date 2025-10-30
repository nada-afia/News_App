import 'package:flutter/material.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
import 'package:news/home/drawer/home_drawer.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/App_colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: HomeDrawer(onDrawerItemClick:onDrawerItemClick,),
        backgroundColor: AppColors.black,
      ),
      appBar: AppBar(title: Center(child: Text(selectedCategory==null?'Home':selectedCategory!.title,))),
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