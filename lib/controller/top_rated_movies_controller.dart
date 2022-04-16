import 'package:flutter/material.dart';
import 'package:flutter_movie_api/data/repository/popularMoviesRepo.dart';
import 'package:flutter_movie_api/data/repository/top_rated_movies_repo.dart';
import 'package:get/get.dart';

import '../models/popular_movies_model.dart';

class TopRatedMoviesController extends GetxController{

  final TopRatedMoviesRepo topRatedMoviesRepo;

  TopRatedMoviesController({required this.topRatedMoviesRepo});

  List<dynamic> _topRatedMoviesList = [];
  List<dynamic> get topRatedMoviesList => _topRatedMoviesList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTopRatedMoviesList() async{
    Response response = await topRatedMoviesRepo.getTopRatedMoviesList();
    if(response.statusCode == 200){
      _topRatedMoviesList = [];
      _topRatedMoviesList.addAll(PopularMovies.fromJson(response.body).popularMovies);
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