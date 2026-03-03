import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String textName;
  const DrawerItem({super.key, required this.iconName, required this.textName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
      child: Row(
        children: [
          Image.asset(iconName),
          SizedBox( width:width*0.02 ,),
          Text(textName,style:AppStyles.whiteBold20 ,)
        ],
      ),
    );
  }
}
