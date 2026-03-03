import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/App_colors.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment: (index % 2 == 0)
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        children: [
          ClipRRect(child: Image.asset(category.image)),
          Container(
            padding: EdgeInsetsDirectional.only(
              start: (index % 2 == 0) ? width * 0.02 : 0,
              end: (index % 2 == 0) ? 0 : width * 0.02,
            ),
            width: width * 0.40,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84),
              color: AppColors.gery,
            ),

            child: Row(
              textDirection: (index % 2 == 0)
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("View All", style: Theme.of(context).textTheme.labelSmall),
                CircleAvatar(
                  backgroundColor: Theme.of(context).splashColor,
                  child: Icon(
                    (index % 2 == 0)
                        ? Icons.arrow_forward_ios_outlined
                        : Icons.arrow_back_ios_outlined,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
