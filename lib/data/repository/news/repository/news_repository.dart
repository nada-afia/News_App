import 'package:news/model/newsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse>getNewsBySourceId(String sourceId);
}