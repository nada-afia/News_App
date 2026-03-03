import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di.dart';
import 'package:news/home/news/cubit/news_state.dart';
import 'package:news/home/news/cubit/news_view_model.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/SourceResponse.dart';

import '../../utils/App_colors.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
      NewsViewModel newsViewModel=NewsViewModel(newsRepository: injectNewsRepository());
@override
@override
  void initState() {
    super.initState();
    newsViewModel.getNews(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  BlocProvider(create: (context) => newsViewModel,
      child:BlocBuilder<NewsViewModel,NewsStates>(
          builder: (context, state) {
            if(state is NewsLoadingState){
              return Center(
                child: CircularProgressIndicator(color: AppColors.gery),
              );
            }
            else if (state is NewsErrorState){
              return  Column(
                        children: [
                          Text(
                            state.errorMessage,
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
            else if(state is NewsSuccessState){
              return ListView.separated(
                      itemBuilder: (context, index) {
                        return NewsItem(news: state.newsList[index]);
                      }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height:height*0.02,); },
                      itemCount:state.newsList.length,
                    );
            }
            return Container();
          },

      )

      ,);
    //   FutureBuilder<NewsResponse>(
    //   future: ApiManger.getNewsSource(source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(color: AppColors.gery),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text(
    //             'something went wrong ',
    //             style: Theme.of(context).textTheme.labelMedium,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {},
    //             child: Text(
    //               'Try Again',
    //               style: Theme.of(context).textTheme.labelMedium,
    //             ),
    //           ),
    //         ],
    //       );
    //     }
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.status ?? 'Something went wrong'),
    //           ElevatedButton(
    //             onPressed: () {},
    //             child: Text(
    //               'Try Again',
    //               style: Theme.of(context).textTheme.labelMedium,
    //             ),
    //           ),
    //         ],
    //       );
    //     }
    //     var newList = snapshot.data?.articles ?? [];
    //     return ListView.separated(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newList[index]);
    //       }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height:height*0.02,); },
    //       itemCount: newList.length,
    //     );
    //   },
    // );
  }
}