import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/category.dart';
import 'package:news/model/newsResponse.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/utils/App_colors.dart';
import 'package:news/utils/app_images.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Articles> searchResults = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height*0.03,right: width*0.02,left: width*0.02),
            child: TextField(
              controller: searchController,
              onChanged: searchNews,
              decoration: InputDecoration(
                hintText: "Search ",
                prefixIcon: Image.asset(themProvider.isDark()?AppImages.searchDark:AppImages.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                  icon:   Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() => searchResults.clear());
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.gery,
              ),
            )
          else if (searchResults.isEmpty)
             Center(child: Text("No results"))
          else
            Expanded(
              child: ListView.separated(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: searchResults[index]);
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: height*0.02,); },
              ),
            ),
        ],
      ),
    );
  }

  void searchNews(String value) async {
    if (value.isEmpty) {
      setState(() => searchResults.clear());
      return;
    }

    setState(() {
      isLoading=true;
    });

    final response = await ApiManger.searchNews(value);

    setState(() {
      searchResults = response.articles ?? [];
      isLoading = false;
    });
  }

}

