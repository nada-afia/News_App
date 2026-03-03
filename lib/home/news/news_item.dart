

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/home/news/news_bottom_sheet.dart';
import 'package:news/model/newsResponse.dart';
import 'package:news/utils/App_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatefulWidget {
  final Articles news;

  const NewsItem({super.key, required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: (){
   showNewsBottomSheet();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.symmetric(horizontal: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).cardColor, width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage ?? '',
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColors.gery),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(widget.news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "By : ${widget.news.author ?? ''}",
                    style: AppStyles.geryMed12,
                  ),
                ),
                Text(
                  timeago.format(
                    DateTime.tryParse(widget.news.publishedAt ?? '') ?? DateTime.now(),
                  ),
                  style: AppStyles.geryMed12,
                ),

                /// Text(news.publishedAt??'')
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNewsBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      context: context, builder: (context) => NewsBottomSheet(news: widget.news,),);
  }
}