import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class ContentVideosRepo extends GetxService{
  final ApiClient apiClient;
  
  ContentVideosRepo({required this.apiClient, contentVideosRepo});
  
  Future<Response> getContentVideosList(String id) async{
    return await apiClient.getData('3/movie/$id/videos?api_key=${AppConstants.apiKey}&language=en-US');
  }
}