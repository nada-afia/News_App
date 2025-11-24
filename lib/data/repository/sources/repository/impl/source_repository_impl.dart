import 'package:news/data/repository/sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/model/SourceResponse.dart';

class SourceRepositoryImpl implements SourceRepository{
   SourcesRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse> getSources(String categoryId) {
   return remoteDataSource.getSource(categoryId);
  }

}