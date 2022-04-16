import 'package:flutter_movie_api/pages/detail_page.dart';
import 'package:flutter_movie_api/pages/home_page.dart';
import 'package:get/get.dart';

import '../pages/splash_screen.dart';

class RouteHelper{
  static const splashScreen = '/splash-screen';
  static const initial = '/';
  static const String popularMovies = '/popular-movies';
  static const String detailPage = '/detail-page';

  static String getSplashScreen() => splashScreen;
  static String getInitial() => initial;
  static String getDetailPage(int pageID, String tag) => '$detailPage?pageID=$pageID&tag=$tag';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const HomePage()),

    GetPage(name: detailPage, page: () {
      var pageID = Get.parameters['pageID'];
      var tag = Get.parameters['tag'];
      return DetailPage(pageID: int.parse(pageID!), tag: tag!);
    }),
  ];
}