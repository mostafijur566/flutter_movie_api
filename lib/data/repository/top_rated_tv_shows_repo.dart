import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class TopRatedTVShowsRepo extends GetxService{
  final ApiClient apiClient;
  TopRatedTVShowsRepo({required this.apiClient});

  Future<Response> getTopRatedTVShowsList() async{
    return await apiClient.getData(AppConstants.topRatedTvShowsEndpoint);
  }
}