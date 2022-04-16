import 'package:flutter/material.dart';
import 'package:flutter_movie_api/data/repository/popular_tv_shows_repo.dart';
import 'package:flutter_movie_api/models/tv_shows_model.dart';
import 'package:get/get.dart';

class PopularTVShowsController extends GetxController{

  final PopularTVShowsRepo popularTVShowsRepo;

  PopularTVShowsController({required this.popularTVShowsRepo});

  List<dynamic> _popularTVShowsList = [];
  List<dynamic> get popularTVShowsList => _popularTVShowsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getpopularTVShowsList() async{
    Response response = await popularTVShowsRepo.getPopularTVShowsList();

    if(response.statusCode == 200){
      _popularTVShowsList = [];
      _popularTVShowsList.addAll(TVShows.fromJson(response.body).tvShows);
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