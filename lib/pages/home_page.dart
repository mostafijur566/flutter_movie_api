import 'package:flutter/material.dart';
import 'package:flutter_movie_api/controller/popular_movies_controller.dart';
import 'package:flutter_movie_api/controller/popular_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_movies_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/trending_now_controller.dart';
import 'package:flutter_movie_api/routes/route_helper.dart';
import 'package:flutter_movie_api/utils/app_colors.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:flutter_movie_api/widgets/custom_text_widget.dart';
import 'package:flutter_movie_api/widgets/small_text_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> _loadResource() async{
    await Get.find<PopularMoviesController>().getPopularMoviesList();
    await Get.find<TopRatedMoviesController>().getTopRatedMoviesList();
    await Get.find<TrendingNowController>().getTrendingNowList();
    await Get.find<PopularTVShowsController>().getpopularTVShowsList();
    await Get.find<TopRatedTVShowsController>().getTopRatedTVShowsList();
  }

  @override
  Widget build(BuildContext context) {

    double screenSize = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Row(
          children: [
            const Icon(Icons.movie),
            SizedBox(width: screenWidth * (20/393),),
            const Text('The Movie DB'),
          ],
        ),
      ),

      body: RefreshIndicator(
          onRefresh: _loadResource,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(top: screenSize * 0.013, right: screenSize * 0.013, left: screenSize * 0.013),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomTextWidget(text: 'Popular Movies', fontSize: screenSize * 0.033,),
                  GetBuilder<PopularMoviesController>(builder: (popularMovies){
                    return Container(
                      height: screenSize * 0.41,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovies.isLoaded ? popularMovies.popularMoviesList.length : 3,
                          itemBuilder: (context, index){
                            return popularMovies.isLoaded ? GestureDetector(
                              onTap: (){
                                Get.toNamed(RouteHelper.getDetailPage(index, AppConstants.popularMoviesTag));
                              },
                              child: Column(
                                children: [
                                   Container(
                                      margin: EdgeInsets.only(top: screenSize * 0.013, right: screenSize * 0.013, left: screenSize * 0.013),
                                      height: screenSize * 0.29,
                                      width: screenWidth * 0.38,
                                      child: Image.network(AppConstants.imgUrl + popularMovies.popularMoviesList[index].posterPath, fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: screenSize * (5/781), left:screenSize * (5/781), top: screenSize * (5/781)),
                                      width: screenWidth * (150/393),
                                      child: Center(child: SmallTextWidget(text: popularMovies.popularMoviesList[index].title, fontSize: screenSize * (16/781),)))
                                ],
                              ),
                            ) : Container(
                              height: screenSize * (230/781),
                              width: screenWidth * (150/393),
                              child: const Center(
                                  child: CircularProgressIndicator()
                              ),
                            );
                          }),
                    );
                  }),

                  CustomTextWidget(text: 'Top Rated Movies', fontSize: screenSize * 0.033,),
                  GetBuilder<TopRatedMoviesController>(builder: (topRatedMovies){
                    return Container(
                      height: screenSize * 0.41,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: topRatedMovies.isLoaded ? topRatedMovies.topRatedMoviesList.length : 3,
                          itemBuilder: (context, index){
                            return topRatedMovies.isLoaded ? GestureDetector(
                              onTap: (){
                                Get.toNamed(RouteHelper.getDetailPage(index, AppConstants.topRatedMoviesTag));
                              },
                              child: Column(
                                children: [
                                Container(
                                      margin: EdgeInsets.only(top: screenSize * 0.013, right:screenSize * 0.013, left: screenSize * 0.013),
                                    height: screenSize * 0.29,
                                    width: screenWidth * 0.38,
                                      child: Image.network(AppConstants.imgUrl + topRatedMovies.topRatedMoviesList[index].posterPath, fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: screenSize * (5/781), left:screenSize * (5/781), top: screenSize * (5/781)),
                                      width: screenWidth * (150/393),
                                      child: Center(child: SmallTextWidget(text: topRatedMovies.topRatedMoviesList[index].title, fontSize: screenSize * (16/781),)))
                                ],
                              ),
                            ) : Container(
                              height: screenSize * (230/781),
                              width: screenWidth * (150/393),
                              child: const Center(
                                  child: CircularProgressIndicator()
                              ),
                            );
                          }),
                    );
                  }),

                  CustomTextWidget(text: 'Trending Now', fontSize: screenSize * 0.033,),
                  GetBuilder<TrendingNowController>(builder: (trendingNow){
                    return Container(
                      height: screenSize * 0.41,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingNow.isLoaded ? trendingNow.trendingNowList.length : 3,
                          itemBuilder: (context, index){
                            return trendingNow.isLoaded ? GestureDetector(
                              onTap: (){
                                Get.toNamed(RouteHelper.getDetailPage(index, AppConstants.trendingNowTag));
                              },
                              child: Column(
                                children: [
                                 Container(
                                     margin: EdgeInsets.only(top: screenSize * 0.013, right:screenSize * 0.013, left: screenSize * 0.013),
                                     height: screenSize * 0.29,
                                     width: screenWidth * 0.38,
                                      child: Image.network(AppConstants.imgUrl + trendingNow.trendingNowList[index].posterPath, fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: screenSize * (5/781), left:screenSize * (5/781), top: screenSize * (5/781)),
                                      width: screenWidth * (150/393),
                                      child: Center(
                                          child: SmallTextWidget(text: trendingNow.trendingNowList[index].title ?? trendingNow.trendingNowList[index].name, fontSize: 16,)))
                                ],
                              ),
                            ) : Container(
                              height: screenSize * (230/781),
                              width: screenWidth * (150/393),
                              child: const Center(
                                  child: CircularProgressIndicator()
                              ),
                            );
                          }),
                    );
                  }),

                  CustomTextWidget(text: 'Popular TV Shows', fontSize: screenSize * 0.033,),
                  GetBuilder<PopularTVShowsController>(builder: (popularTVShows){
                    return Container(
                      height: screenSize * 0.41,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: popularTVShows.isLoaded ? popularTVShows.popularTVShowsList.length : 3,
                          itemBuilder: (context, index){
                            return popularTVShows.isLoaded ? GestureDetector(
                              onTap: (){
                                Get.toNamed(RouteHelper.getDetailPage(index, AppConstants.popularTvShowsTag));
                              },
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: screenSize * 0.013, right:screenSize * 0.013, left: screenSize * 0.013),
                                      height: screenSize * 0.29,
                                      width: screenWidth * 0.38,
                                      child: Image.network(AppConstants.imgUrl + popularTVShows.popularTVShowsList[index].posterPath, fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: screenSize * (5/781), left:screenSize * (5/781), top: screenSize * (5/781)),
                                      width: screenWidth * (150/393),
                                      child: Center(
                                          child: SmallTextWidget(text: popularTVShows.popularTVShowsList[index].name ?? popularTVShows.popularTVShowsList[index].title, fontSize: 16,)))
                                ],
                              ),
                            ) : Container(
                              height: screenSize * (230/781),
                              width: screenWidth * (150/393),
                              child: const Center(
                                  child: CircularProgressIndicator()
                              ),
                            );
                          }),
                    );
                  }),


                  CustomTextWidget(text: 'Top Rated TV Shows', fontSize: screenSize * 0.033,),
                  GetBuilder<TopRatedTVShowsController>(builder: (topRatedTVShows){
                    return Container(
                      height: screenSize * 0.41,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: topRatedTVShows.isLoaded ? topRatedTVShows.topRatedTVShowsList.length : 3,
                          itemBuilder: (context, index){
                            return topRatedTVShows.isLoaded ? GestureDetector(
                              onTap: (){
                                Get.toNamed(RouteHelper.getDetailPage(index, AppConstants.topRatedTvShowsTag));
                              },
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: screenSize * 0.013, right:screenSize * 0.013, left: screenSize * 0.013),
                                      height: screenSize * 0.29,
                                      width: screenWidth * 0.38,
                                      child: Image.network(AppConstants.imgUrl + topRatedTVShows.topRatedTVShowsList[index].posterPath, fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: screenSize * (5/781), left:screenSize * (5/781), top: screenSize * (5/781)),
                                      width: screenWidth * (150/393),
                                      child: Center(
                                          child: SmallTextWidget(text: topRatedTVShows.topRatedTVShowsList[index].name, fontSize: 16,)))
                                ],
                              ),
                            ) : Container(
                              height: screenSize * (230/781),
                              width: screenWidth * (150/393),
                              child: const Center(
                                  child: CircularProgressIndicator()
                              ),
                            );
                          }),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
