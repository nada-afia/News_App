import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/impl/news_remote_data_source_impl.dart';
import 'package:news/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/home/news/cubit/news_state.dart';

class NewsViewModel extends Cubit<NewsStates>{
  late NewsRepository newsRepository;
  late  NewsRemoteDataSource remoteDataSource;
  late ApiManger apiManger;
  NewsViewModel():super(NewsLoadingState()){
    apiManger=ApiManger();
    remoteDataSource =NewsRemoteDataSourceImpl(apiManger: apiManger);
    newsRepository=NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }
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