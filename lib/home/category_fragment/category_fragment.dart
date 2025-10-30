import 'package:flutter/material.dart';
import 'package:news/home/category_fragment/category_item.dart';
import 'package:news/model/category.dart';
typedef OnCategoryItemClick=void Function(Category);
class CategoryFragment extends StatelessWidget {
  OnCategoryItemClick onCategoryItemClick;
  CategoryFragment({super.key,required this.onCategoryItemClick});
  List<Category> categoryList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoryList = Category.getCategoryList(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Morning\nHere is Some News For You",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: height * 0.02),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    onCategoryItemClick(categoryList[index]);
                  },
                  child: CategoryItem(category: categoryList[index], index: index));
            },
            itemCount: categoryList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: height * 0.02);
            },
          ),
        ),
      ],
    );
  }
}
