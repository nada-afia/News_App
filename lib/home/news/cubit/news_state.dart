import 'package:news/model/newsResponse.dart';

abstract class NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsErrorState extends NewsStates{
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsStates{
  List<Articles> newsList;
  NewsSuccessState({required this.newsList});

}