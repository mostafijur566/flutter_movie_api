import 'package:flutter_movie_api/data/repository/tv_cast_repo.dart';
import 'package:flutter_movie_api/models/cast_model.dart';
import 'package:get/get.dart';

class TvCastController extends GetxController{
  final TvCastRepo tvCastRepo;

  TvCastController({required this.tvCastRepo});

  List<dynamic> _tvCastList = [];
  List<dynamic> get tvCastList => _tvCastList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTvCastList(String id) async{
    Response response = await tvCastRepo.getTvCastList(id);

    if(response.statusCode == 200){
      _tvCastList = [];
      _tvCastList.addAll(CastModel.fromJson(response.body).cast);
      _isLoaded = true;
      update();
    }
  }
}