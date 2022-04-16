import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class MoviesCastRepo extends GetxService{
  final ApiClient apiClient;
  
  MoviesCastRepo({required this.apiClient});
  
  Future<Response> getMoviesCastList(String id) async{
    return await apiClient.getData('3/movie/$id/credits?api_key=${AppConstants.apiKey}&language=en-US');
  }
}