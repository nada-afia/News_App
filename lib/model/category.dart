import '../utils/app_images.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.image, required this.title});

  static List<Category> getCategoryList(bool isDark) {
    return [
      Category(
        id: 'general',
        image: isDark ? AppImages.generalDark : AppImages.general,
        title: 'General',
      ),
      Category(
        id: 'business',
        image: isDark ? AppImages.businessDark : AppImages.business,
        title: 'Business',
      ),
      Category(
        id: 'sport',
        image: isDark ? AppImages.sportDark : AppImages.sport,
        title: 'Sport',
      ),
      Category(
        id: 'technology',
        image: isDark ? AppImages.technologyDark : AppImages.technology,
        title: 'technology',
      ),
      Category(
        id: 'entertainment',
        image: isDark ? AppImages.entertainmentDark : AppImages.entertainment,
        title: 'Entertainment',
      ),
      Category(
        id: 'health',
        image: isDark ? AppImages.healthDark : AppImages.health,
        title: 'Health',
      ),
      Category(
        id: 'science',
        image: isDark ? AppImages.scienceDark : AppImages.science,
        title: 'Science',
      ),
    ];
  }
}
