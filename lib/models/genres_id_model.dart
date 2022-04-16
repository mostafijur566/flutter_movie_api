class GenresIDModel {
  late List<Genres> _genres;
  List<Genres> get genres => _genres;

  GenresIDModel({genres}){
    this._genres = genres;
  }

  GenresIDModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      _genres = <Genres>[];
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
  }

}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}