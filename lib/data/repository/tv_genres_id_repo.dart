import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class TvGenresIdRepo extends GetxService{

  final ApiClient apiClient;

  TvGenresIdRepo({required this.apiClient});

  Future<Response> getTvGenresIdList() async{
    return await apiClient.getData(AppConstants.tvGenresIdEndpoint);
  }
}