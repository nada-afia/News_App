import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/home/news/cubit/news_state.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState());
    Future<void> getNews(String sourceId ) async {
      try{
     var response =await ApiManger.getNewsSource(sourceId);
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