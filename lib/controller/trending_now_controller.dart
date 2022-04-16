import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/trending_now_repo.dart';
import '../models/popular_movies_model.dart';

class TrendingNowController extends GetxController{

  final TrendingNowRepo trendingNowRepo;

  TrendingNowController({required this.trendingNowRepo});

  List<dynamic> _trendingNowList = [];
  List<dynamic> get trendingNowList => _trendingNowList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTrendingNowList() async{
    Response response = await trendingNowRepo.getTrendingNowList();
    if(response.statusCode == 200){
      _trendingNowList = [];
      _trendingNowList.addAll(PopularMovies.fromJson(response.body).popularMovies);
      _isLoaded = true;
      update();
    }
    else{
      Get.snackbar('Oops!', 'Please check your internet connection',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}