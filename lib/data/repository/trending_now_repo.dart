
import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class TrendingNowRepo extends GetxService{

  final ApiClient apiClient;
  TrendingNowRepo({required this.apiClient});

  Future<Response> getTrendingNowList() async{
    return await apiClient.getData(AppConstants.trendingEndpoint);
  }

}