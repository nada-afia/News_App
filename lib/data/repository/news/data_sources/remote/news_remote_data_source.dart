import 'package:news/model/newsResponse.dart';
abstract class NewsRemoteDataSource{
  Future<NewsResponse>getNewsBySourceId(String sourceId);
}