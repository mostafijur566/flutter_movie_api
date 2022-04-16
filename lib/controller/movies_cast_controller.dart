import 'package:flutter_movie_api/data/repository/movies_cast_repo.dart';
import 'package:flutter_movie_api/models/cast_model.dart';
import 'package:get/get.dart';

class MoviesCastController extends GetxController{

  final MoviesCastRepo moviesCastRepo;

  MoviesCastController({required this.moviesCastRepo});

  List<dynamic> _moviesCastList = [];
  List<dynamic> get moviesCastList => _moviesCastList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMoviesCastList(String id) async{
    Response response = await moviesCastRepo.getMoviesCastList(id);

    if(response.statusCode == 200){
      print('got cast');
      _moviesCastList = [];
      _moviesCastList.addAll(CastModel.fromJson(response.body).cast);
      _isLoaded = true;
      update();
    }
  }
}