import 'package:flutter/material.dart';
import 'package:flutter_movie_api/controller/content_videos_controller.dart';
import 'package:flutter_movie_api/controller/genres_id_controller.dart';
import 'package:flutter_movie_api/controller/popular_movies_controller.dart';
import 'package:flutter_movie_api/controller/popular_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_movies_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/trending_now_controller.dart';
import 'package:flutter_movie_api/controller/tv_genres_id_controller.dart';
import 'package:flutter_movie_api/pages/detail_page.dart';
import 'package:flutter_movie_api/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<PopularMoviesController>().getPopularMoviesList();
    Get.find<TopRatedMoviesController>().getTopRatedMoviesList();
    Get.find<TrendingNowController>().getTrendingNowList();
    Get.find<PopularTVShowsController>().getpopularTVShowsList();
    Get.find<TopRatedTVShowsController>().getTopRatedTVShowsList();
    Get.find<GenresIDController>().getGenresIDList();
    Get.find<TvGenresIdController>().getGenresIDList();
    return GetMaterialApp(
      title: 'The Movie DB',

      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}