import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class TvCastRepo extends GetxService{
  final ApiClient apiClient;

  TvCastRepo({required this.apiClient});

  Future<Response> getTvCastList(String id) async{
    return await apiClient.getData('3/tv/$id/credits?api_key=${AppConstants.apiKey}&language=en-US');
  }
}