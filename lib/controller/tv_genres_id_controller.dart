import 'package:flutter_movie_api/data/repository/tv_genres_id_repo.dart';
import 'package:get/get.dart';

import '../models/genres_id_model.dart';

class TvGenresIdController extends GetxController{
  final TvGenresIdRepo tvGenresIDRepo;

  TvGenresIdController({required this.tvGenresIDRepo});

  List<dynamic> _tvGenresIDList = [];
  List<dynamic> get tvGenresIDList => _tvGenresIDList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getGenresIDList() async{
    Response response = await tvGenresIDRepo.getTvGenresIdList();

    if(response.statusCode == 200){
      print('tv-videos');
      _tvGenresIDList = [];
      _tvGenresIDList.addAll(GenresIDModel.fromJson(response.body).genres);
      update();
    }
  }
}