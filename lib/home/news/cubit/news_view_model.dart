import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/home/news/cubit/news_state.dart';

class NewsViewModel extends Cubit<NewsStates>{
  late NewsRepository newsRepository;
  NewsViewModel({required this.newsRepository}):super(NewsLoadingState());
  Future<void> getNews(String sourceId ) async {
    try{
      var response =await newsRepository.getNewsBySourceId(sourceId);
      if(response.status=='error'){
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
      else if(response.status=='ok'){
        emit(NewsSuccessState( newsList:response.articles!));
        return;
      }
    }
    catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}