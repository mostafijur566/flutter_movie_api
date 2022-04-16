import 'package:flutter_movie_api/data/repository/tv_content_videos_repo.dart';
import 'package:get/get.dart';

import '../models/content_videos_model.dart';

class TvContentVideosController extends GetxController{
  final TvContentVideosRepo tvContentVideosRepo;

  TvContentVideosController({required this.tvContentVideosRepo});

  List<dynamic> _tvContentVideosList = [];
  List<dynamic> get tvContentVideosList => _tvContentVideosList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTvContentVideosList(String id) async{
    Response response = await tvContentVideosRepo.getTvContentVideosList(id);

    if(response.statusCode == 200){
      _tvContentVideosList = [];
      _tvContentVideosList.addAll(ContentVideos.fromJson(response.body).contentVideos);
      _isLoaded = true;
      update();
    }
    else{
      print(response.statusCode);
    }
  }
}