import 'package:flutter/material.dart';

import '../../utils/App_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return  Divider(
    thickness: 2,
    color: AppColors.white,
        endIndent: width*0.04,
    indent: width*0.04,
      );
  }
}
