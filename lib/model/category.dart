import 'package:flutter/cupertino.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_images.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.image, required this.title});

  static List<Category> getCategoryList( BuildContext context) {
    var themProvider=Provider.of<AppThemeProvider>(context);
    return [
      Category(
        id: 'general',
        image: themProvider.isDark() ? AppImages.generalDark : AppImages.general,
        title: 'General',
      ),
      Category(
        id: 'business',
        image: themProvider.isDark() ? AppImages.businessDark : AppImages.business,
        title: 'Business',
      ),
      Category(
        id: 'sport',
        image: themProvider.isDark() ? AppImages.sportDark : AppImages.sport,
        title: 'Sport',
      ),
      Category(
        id: 'technology',
        image: themProvider.isDark() ? AppImages.technologyDark : AppImages.technology,
        title: 'technology',
      ),
      Category(
        id: 'entertainment',
        image: themProvider.isDark() ? AppImages.entertainmentDark : AppImages.entertainment,
        title: 'Entertainment',
      ),
      Category(
        id: 'health',
        image: themProvider.isDark() ? AppImages.healthDark : AppImages.health,
        title: 'Health',
      ),
      Category(
        id: 'science',
        image: themProvider.isDark() ? AppImages.scienceDark : AppImages.science,
        title: 'Science',
      ),
    ];
  }
}
