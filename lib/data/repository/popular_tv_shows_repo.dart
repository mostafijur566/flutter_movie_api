import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularTVShowsRepo extends GetxService{
  final ApiClient apiClient;
  PopularTVShowsRepo({required this.apiClient});

  Future<Response> getPopularTVShowsList() async{
    return await apiClient.getData(AppConstants.popularTvShowsEndpoint);
  }
}