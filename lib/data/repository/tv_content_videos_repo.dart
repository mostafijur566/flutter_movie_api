import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class TvContentVideosRepo extends GetxService{
  final ApiClient apiClient;

  TvContentVideosRepo({required this.apiClient});

  Future<Response> getTvContentVideosList(String id) async{
    return await apiClient.getData('3/tv/$id/videos?api_key=${AppConstants.apiKey}&language=en-US');
  }
}