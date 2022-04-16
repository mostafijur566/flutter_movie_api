import 'package:flutter_movie_api/controller/content_videos_controller.dart';
import 'package:flutter_movie_api/controller/genres_id_controller.dart';
import 'package:flutter_movie_api/controller/popular_movies_controller.dart';
import 'package:flutter_movie_api/controller/popular_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_movies_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/trending_now_controller.dart';
import 'package:flutter_movie_api/controller/tv_genres_id_controller.dart';
import 'package:flutter_movie_api/data/api/api_client.dart';
import 'package:flutter_movie_api/data/repository/content_videos_repo.dart';
import 'package:flutter_movie_api/data/repository/genres_id_repo.dart';
import 'package:flutter_movie_api/data/repository/popularMoviesRepo.dart';
import 'package:flutter_movie_api/data/repository/popular_tv_shows_repo.dart';
import 'package:flutter_movie_api/data/repository/top_rated_tv_shows_repo.dart';
import 'package:flutter_movie_api/data/repository/trending_now_repo.dart';
import 'package:flutter_movie_api/data/repository/tv_genres_id_repo.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/repository/top_rated_movies_repo.dart';

Future<void> init() async{

  //API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  //All Repository
  Get.lazyPut(() => PopularMoviesRepo(apiClient: Get.find()));
  Get.lazyPut(() => TopRatedMoviesRepo(apiClient: Get.find()));
  Get.lazyPut(() => TrendingNowRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularTVShowsRepo(apiClient: Get.find()));
  Get.lazyPut(() => TopRatedTVShowsRepo(apiClient: Get.find()));
  Get.lazyPut(() => GenresIDRepo(apiClient: Get.find()));
  Get.lazyPut(() => TvGenresIdRepo(apiClient: Get.find()));

  //All Controller
  Get.lazyPut(() => PopularMoviesController(popularMoviesRepo: Get.find()));
  Get.lazyPut(() => TopRatedMoviesController(topRatedMoviesRepo: Get.find()));
  Get.lazyPut(() => TrendingNowController(trendingNowRepo: Get.find()));
  Get.lazyPut(() => PopularTVShowsController(popularTVShowsRepo: Get.find()));
  Get.lazyPut(() => TopRatedTVShowsController(topRatedTVShowsRepo: Get.find()));
  Get.lazyPut(() => GenresIDController(genresIDRepo: Get.find()));
  Get.lazyPut(() => TvGenresIdController(tvGenresIDRepo: Get.find()));
}