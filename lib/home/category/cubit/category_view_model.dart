import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/sources/data_sources/remote/impl/sources_remote_data_source_impl.dart';
import 'package:news/data/repository/sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/home/category/cubit/caegory_states.dart';
class CubitViewModel extends Cubit <CategoryStates>{
 late SourceRepository sourceRepository;
 late SourcesRemoteDataSource remoteDataSource;
  late ApiManger apiManger;
  CubitViewModel():super(CategoryLoadingState()){
    apiManger=ApiManger();
    remoteDataSource =SourcesRemoteDataSourceImpl(apiManger: apiManger);
    sourceRepository = SourceRepositoryImpl(
        remoteDataSource: remoteDataSource);
  }
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