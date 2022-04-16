
import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class TopRatedMoviesRepo extends GetxService{

  final ApiClient apiClient;
  TopRatedMoviesRepo({required this.apiClient});

  Future<Response> getTopRatedMoviesList() async{
    return await apiClient.getData(AppConstants.topRatedMoviesEndpoint);
  }

}