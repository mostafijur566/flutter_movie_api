import 'package:flutter_movie_api/data/repository/content_videos_repo.dart';
import 'package:get/get.dart';

import '../models/content_videos_model.dart';

class ContentVideosController extends GetxController{
  final ContentVideosRepo contentVideosRepo;

  ContentVideosController({required this.contentVideosRepo});

  List<dynamic> _contentVideosList = [];
  List<dynamic> get contentVideosList => _contentVideosList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getContentVideosList(String id) async{
    Response response = await contentVideosRepo.getContentVideosList(id);

    if(response.statusCode == 200){
      _contentVideosList = [];
      _contentVideosList.addAll(ContentVideos.fromJson(response.body).contentVideos);
      _isLoaded = true;
      update();
    }
  }
}