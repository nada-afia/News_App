import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/home/category/cubit/caegory_states.dart';
class CubitViewModel extends Cubit <CategoryStates>{
 late SourceRepository sourceRepository;
  CubitViewModel({required this.sourceRepository}):super(CategoryLoadingState());
void getSources(String categoryId )async{
 try{
   emit(CategoryLoadingState());
  var response = await sourceRepository.getSources(categoryId);
  if(response.status=='error'){
   emit(CategoryErrorState(errorMessage: response.message!));
   return;
  }
  if(response.status=='ok'){
      emit(CategorySuccessState(sourceList:response.sources!));
      return;
  }
 }
 catch(e){
   emit(CategoryErrorState(errorMessage: e.toString()));
 }
}
}