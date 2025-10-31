import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/home/news/news_webview.dart';
import 'package:news/model/newsResponse.dart';
import 'package:news/utils/App_colors.dart';

class NewsBottomSheet extends StatefulWidget {
  final Articles news;
  const NewsBottomSheet({super.key, required this.news});

  @override
  State<NewsBottomSheet> createState() => _NewsBottomSheetState();
}

class _NewsBottomSheetState extends State<NewsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
       padding: EdgeInsets.symmetric(
      horizontal: width * 0.03,
      vertical: height * 0.01,
    ),
      child: SingleChildScrollView(
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
            SizedBox(height: height * 0.02),
            Text(widget.news.content ?? '', style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: height * 0.02),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).canvasColor,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  print('Opening URL: ${widget.news.url}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsWebView(url: widget.news.url ?? ''),
                    ),
        
                  );
                },
                child: Text('View Full Article',style: Theme.of(context).textTheme.labelLarge,))
          ],
        ),
      ),
    );
  }
}
