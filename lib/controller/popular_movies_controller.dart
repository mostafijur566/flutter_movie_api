import 'package:flutter/material.dart';
import 'package:flutter_movie_api/data/repository/popularMoviesRepo.dart';
import 'package:get/get.dart';

import '../models/popular_movies_model.dart';

class PopularMoviesController extends GetxController{

  final PopularMoviesRepo popularMoviesRepo;

  PopularMoviesController({required this.popularMoviesRepo});

  List<dynamic> _popularMoviesList = [];
  List<dynamic> get popularMoviesList => _popularMoviesList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularMoviesList() async{
    Response response = await popularMoviesRepo.getPopularMoviesList();
    if(response.statusCode == 200){
      _popularMoviesList = [];
      _popularMoviesList.addAll(PopularMovies.fromJson(response.body).popularMovies);
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