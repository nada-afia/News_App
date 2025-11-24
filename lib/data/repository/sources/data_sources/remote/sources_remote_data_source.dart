import 'package:news/model/SourceResponse.dart';

abstract class SourcesRemoteDataSource{
 Future<SourceResponse>getSource(String categoryId);
}