import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_api/controller/content_videos_controller.dart';
import 'package:flutter_movie_api/controller/genres_id_controller.dart';
import 'package:flutter_movie_api/controller/movies_cast_controller.dart';
import 'package:flutter_movie_api/controller/popular_movies_controller.dart';
import 'package:flutter_movie_api/controller/popular_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_movies_controller.dart';
import 'package:flutter_movie_api/controller/top_rated_tv_shows_controller.dart';
import 'package:flutter_movie_api/controller/trending_now_controller.dart';
import 'package:flutter_movie_api/controller/tv_cast_controller.dart';
import 'package:flutter_movie_api/controller/tv_content_videos_controller.dart';
import 'package:flutter_movie_api/controller/tv_genres_id_controller.dart';
import 'package:flutter_movie_api/data/repository/content_videos_repo.dart';
import 'package:flutter_movie_api/data/repository/movies_cast_repo.dart';
import 'package:flutter_movie_api/data/repository/tv_cast_repo.dart';
import 'package:flutter_movie_api/data/repository/tv_content_videos_repo.dart';
import 'package:flutter_movie_api/utils/app_colors.dart';
import 'package:flutter_movie_api/utils/app_constants.dart';
import 'package:flutter_movie_api/widgets/content_viewer.dart';
import 'package:flutter_movie_api/widgets/expandable_text_widget.dart';
import 'package:flutter_movie_api/widgets/genres_widget.dart';
import 'package:flutter_movie_api/widgets/small_text_widget.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pageID, required this.tag}) : super(key: key);

  final int pageID;
  final String tag;

  
  loadVideos(String id) async{
    if(tag.substring(tag.length - 8, tag.length) == 'tv-shows'){
      await Get.find<TvContentVideosController>().getTvContentVideosList(id);
      await Get.find<TvCastController>().getTvCastList(id);
    }
    else{
      await Get.find<ContentVideosController>().getContentVideosList(id);
      await Get.find<MoviesCastController>().getMoviesCastList(id);
    }
  }


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    var contentList;
    List<dynamic> contentGenresIds = [];

    //..........................Initializing tag for five categories content and their ids.........................
    if(tag == AppConstants.popularMoviesTag){
      contentList = Get.find<PopularMoviesController>().popularMoviesList[pageID];
      contentGenresIds = contentList.genreIds;
    }

    else if(tag == AppConstants.topRatedMoviesTag){
      contentList = Get.find<TopRatedMoviesController>().topRatedMoviesList[pageID];
      contentGenresIds = contentList.genreIds;
    }

    else if(tag == AppConstants.trendingNowTag){
      contentList = Get.find<TrendingNowController>().trendingNowList[pageID];
      contentGenresIds = contentList.genreIds;
    }

    else if(tag == AppConstants.popularTvShowsTag){
      contentList = Get.find<PopularTVShowsController>().popularTVShowsList[pageID];
      contentGenresIds = contentList.genreIds;
    }

    else if(tag == AppConstants.topRatedTvShowsTag){
      contentList = Get.find<TopRatedTVShowsController>().topRatedTVShowsList[pageID];
      contentGenresIds = contentList.genreIds;
    }


    //........................Calling GetX Lazyput...........................
    Get.lazyPut(() => ContentVideosRepo(apiClient: Get.find()));
    Get.lazyPut(() => ContentVideosController(contentVideosRepo: Get.find()));
    Get.lazyPut(() => MoviesCastRepo(apiClient: Get.find()));
    Get.lazyPut(() => TvCastRepo(apiClient: Get.find()));

    Get.lazyPut(() => TvContentVideosRepo(apiClient: Get.find()));
    Get.lazyPut(() => TvContentVideosController(tvContentVideosRepo: Get.find()));
    Get.lazyPut(() => MoviesCastController(moviesCastRepo: Get.find()));
    Get.lazyPut(() => TvCastController(tvCastRepo: Get.find()));

    loadVideos(contentList.id.toString());

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(contentList.title ?? contentList.name),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: screenWidth * (10 / 393), right: screenWidth * (10 / 393), top: screenHeight * (10 / 781)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //....................background poster...................
              Container(
                width: double.maxFinite,
                height: screenWidth / 2,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * (15 / 393)),
                  child: contentList.backdropPath == null ?
                  Image.network(
                    AppConstants.imgBackgroundUrl + contentList.posterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ):
                  Image.network(
                    AppConstants.imgBackgroundUrl + contentList.backdropPath,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: screenHeight * (15 / 781),),


              //........................TV - Shows Genres........................
              tag.substring(tag.length - 8, tag.length) == 'tv-shows' ?
              GetBuilder<TvGenresIdController>(builder: (genresID){
                return Container(
                  width: double.maxFinite,
                  height: screenHeight * (50 /781),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: contentGenresIds.length,
                      itemBuilder: (context, index){
                        return Container(
                            padding: EdgeInsets.only(right: screenHeight * (10 / 781)),
                            child: GenresWidget(id: contentGenresIds[index], genresList: genresID.tvGenresIDList,)
                        );
                      }),
                );
              }) :


              //........................Movies Genres........................
              GetBuilder<GenresIDController>(builder: (genresID){
                return Container(
                  width: double.maxFinite,
                  height: screenHeight * (50 /781),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: contentGenresIds.length,
                      itemBuilder: (context, index){
                        return Container(
                            padding: EdgeInsets.only(right: screenHeight * (10 /781),),
                            child: GenresWidget(id: contentGenresIds[index], genresList: genresID.genresIDList,)
                        );
                      }),
                );
              }),

              SizedBox(height: screenHeight * (20 /781),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //.........................Content Poster....................
                  Container(
                    width: screenHeight * (120 / 781),
                    height: screenHeight * (180 / 781),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenHeight * (15 / 781)),
                        image: DecorationImage(
                            image: NetworkImage(AppConstants.imgUrl + contentList.posterPath),
                            fit: BoxFit.fill
                        )
                    ),
                  ),

                  SizedBox(width: screenWidth * (20 / 393),),

                  //.......................Content Details.....................
                  Container(
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallTextWidget(text: contentList.title ?? contentList.name, fontSize: screenWidth * (22 / 393),),
                          SizedBox(height: screenHeight * (10/ 781),),
                          Row(
                            children: [
                              SmallTextWidget(text: 'Rating  ', fontSize: screenWidth * (16 / 393), textColor: AppColors.smallTextColor,),
                              Icon(Icons.star, size: screenWidth * (20 / 393), color: AppColors.iconColor,),
                              SmallTextWidget(text: ' ${contentList.voteAverage}', fontSize: screenWidth * (16 / 393), textColor: AppColors.smallTextColor,),
                            ],
                          ),

                          SmallTextWidget(text: 'Popularity:  ${contentList.popularity}', fontSize: screenWidth * (16 / 393), textColor: AppColors.smallTextColor,),
                          SmallTextWidget(text: 'Release-date:  ', fontSize: screenWidth * (16 / 393), textColor: AppColors.smallTextColor,),
                          SmallTextWidget(text: contentList.releaseDate ?? contentList.firstAirDate, fontSize: screenWidth * (16 / 393), textColor: AppColors.smallTextColor,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * (20 / 781),),

              //..........................Content Overview...................
              SmallTextWidget(text: 'Story Line', fontSize: screenWidth * (22 / 393),),
              SizedBox(height: screenHeight * (10 / 781),),
              ExpandableTextWidget(text: contentList.overview,),
              SizedBox(height: screenHeight * (20 / 781),),

              tag.substring(tag.length - 8, tag.length) == 'tv-shows' ?
              //............................TV Shows YouTube Short Clip............................
              GetBuilder<TvContentVideosController>(builder: (videos) =>
                  ContentViewer(videos: videos.tvContentVideosList)
              ) :

              //............................Movies YouTube Short Clip............................
              GetBuilder<ContentVideosController>(builder: (videos) =>
                  ContentViewer(videos: videos.contentVideosList)
              ),

              SizedBox(height: screenHeight * (20 / 781),),

              //..........................Cast............................

              tag.substring(tag.length - 8, tag.length) == 'tv-shows' ?

              //..........................TV - Shows Cast..............................
              GetBuilder<TvCastController>(builder: (cast){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cast.tvCastList.isEmpty ? Container() : SmallTextWidget(text: 'Cast', fontSize: screenWidth * (22 / 393),),
                    SizedBox(height: screenHeight * (10 / 781),),
                    Container(
                      height: cast.tvCastList.isEmpty ? 0 : screenWidth / 3.3,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cast.tvCastList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * (20 / 393)),
                            child: Column(
                              children: [

                                //.......................Actor Default Circle Avatar....................
                                cast.tvCastList[index].profilePath == null ? CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: screenWidth * (40 / 393),
                                  backgroundImage: const AssetImage('assets/images/blank_profile.png'),
                                )

                                //.......................Actor Online Circle Avatar....................
                                    : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: screenWidth * (40 / 393),
                                  backgroundImage: NetworkImage(AppConstants.imgUrl + cast.tvCastList[index].profilePath),
                                ),

                                SizedBox(height: screenHeight * (10 / 781),),
                                SmallTextWidget( text: cast.tvCastList[index].name, fontSize: screenWidth * (16 / 393),)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }):

              //..........................Movies Cast..............................
              GetBuilder<MoviesCastController>(builder: (cast){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cast.moviesCastList.isEmpty ? Container() : SmallTextWidget(text: 'Cast', fontSize: screenWidth * (22 / 393),),
                    SizedBox(height: screenHeight * (10 / 781),),
                    Container(
                      height: cast.moviesCastList.isEmpty ? 0 : screenWidth / 3.3,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cast.moviesCastList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * (20 / 393)),
                            child: Column(
                              children: [
                                //.......................Actor Default Circle Avatar....................
                                cast.moviesCastList[index].profilePath == null ? CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: screenWidth * (40 / 393),
                                  backgroundImage: const AssetImage('assets/images/blank_profile.png'),
                                )

                                //.......................Actor Online Circle Avatar....................
                                    : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: screenWidth * (40 / 393),
                                  backgroundImage: NetworkImage(AppConstants.imgUrl + cast.moviesCastList[index].profilePath),
                                ),

                                SizedBox(height: screenHeight * (10 / 781),),
                                SmallTextWidget( text: cast.moviesCastList[index].name, fontSize: screenWidth * (16 / 393),)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),

              SizedBox(height: screenHeight * (10 / 781),),

            ],
          ),
        ),
      ),
    );
  }
}

