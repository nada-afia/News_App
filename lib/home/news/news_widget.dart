import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/newsResponse.dart';

import '../../utils/App_colors.dart';

class NewsWidget extends StatelessWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNewsSource(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gery),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'something went wrong ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.status ?? 'Something went wrong'),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var newList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              newList[index].title ?? '',
              style: Theme.of(context).textTheme.labelMedium,
            );
          },
        );
      },
    );
  }
}