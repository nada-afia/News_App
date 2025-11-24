import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/model/newsResponse.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    var newsResponse =apiManger.getNewsSource(sourceId);
    return newsResponse;
  }
}