import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news/model/SourceResponse.dart';

class SourcesRemoteDataSourceImpl implements SourcesRemoteDataSource{
  ApiManger apiManger;
  SourcesRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse> getSource(String categoryId) {
    return apiManger.getSources(categoryId: categoryId);
  }

}