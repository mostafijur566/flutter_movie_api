import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class GenresIDRepo extends GetxService{
  final ApiClient apiClient;

  GenresIDRepo({required this.apiClient});

  Future<Response> getGenresIDList() async{
    return await apiClient.getData(AppConstants.genresIdEndpoint);
  }
}