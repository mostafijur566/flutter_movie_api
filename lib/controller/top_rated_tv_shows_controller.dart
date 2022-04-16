import 'package:flutter/material.dart';
import 'package:flutter_movie_api/data/repository/top_rated_tv_shows_repo.dart';
import 'package:flutter_movie_api/models/tv_shows_model.dart';
import 'package:get/get.dart';

class TopRatedTVShowsController extends GetxController{
  final TopRatedTVShowsRepo topRatedTVShowsRepo;

  TopRatedTVShowsController({required this.topRatedTVShowsRepo});

  List<dynamic> _topRatedTVShowsList = [];
  List<dynamic> get topRatedTVShowsList => _topRatedTVShowsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTopRatedTVShowsList() async{
    Response response = await topRatedTVShowsRepo.getTopRatedTVShowsList();

    if(response.statusCode == 200){
      _topRatedTVShowsList = [];
      _topRatedTVShowsList.addAll(TVShows.fromJson(response.body).tvShows);
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