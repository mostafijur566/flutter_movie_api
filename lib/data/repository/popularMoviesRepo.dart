
import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PopularMoviesRepo extends GetxService{

  final ApiClient apiClient;
  PopularMoviesRepo({required this.apiClient});

  Future<Response> getPopularMoviesList() async{
    return await apiClient.getData(AppConstants.popularMoviesEndpoint);
  }

}