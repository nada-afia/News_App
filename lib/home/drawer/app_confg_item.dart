import 'package:flutter/material.dart';

import '../../utils/App_colors.dart';
import '../../utils/app_styles.dart';

class AppConfIgItem extends StatelessWidget {
  final String name;
  const AppConfIgItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal:width*0.04 ),
      padding: EdgeInsets.symmetric(
          horizontal: width*0.03,
          vertical: height*0.01
      ),
      decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color:  AppColors.white,
                  width: 2
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           name,
            style: AppStyles.whiteMed20 ,
          ),
          Icon(Icons.arrow_drop_down_outlined,color: AppColors.white,)
        ],
      ),
    );
  }
}
