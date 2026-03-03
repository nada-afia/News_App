import 'package:news/model/SourceResponse.dart';

abstract class CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategoryInitialState extends CategoryStates{}
class CategoryErrorState extends CategoryStates{
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}
class CategorySuccessState extends CategoryStates{
  List<Source> sourceList;
  CategorySuccessState({required this.sourceList});
}