import 'package:flutter_movie_api/data/repository/genres_id_repo.dart';
import 'package:get/get.dart';

import '../models/genres_id_model.dart';

class GenresIDController extends GetxController{
  final GenresIDRepo genresIDRepo;

  GenresIDController({required this.genresIDRepo});

  List<dynamic> _genresIDList = [];
  List<dynamic> get genresIDList => _genresIDList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getGenresIDList() async{
    Response response = await genresIDRepo.getGenresIDList();

    if(response.statusCode == 200){
      _genresIDList = [];
      _genresIDList.addAll(GenresIDModel.fromJson(response.body).genres);
      _isLoaded = true;
      update();
    }
  }
}