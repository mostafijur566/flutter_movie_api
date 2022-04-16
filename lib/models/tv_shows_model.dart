class TVShows{

  late List<TvShowsModel> _tvShows;
  List<TvShowsModel> get tvShows => _tvShows;

  TVShowsModel({required tvShows}){
    this._tvShows = tvShows;
  }

  TVShows.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _tvShows = <TvShowsModel>[];
      json['results'].forEach((v) {
        _tvShows.add(new TvShowsModel.fromJson(v));
      });
    }
  }
}

class TvShowsModel {
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  String? releaseDate;
  int? id;
  String? name;
  String? title;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? voteAverage;

  TvShowsModel(
      {this.backdropPath,
        this.firstAirDate,
        this.genreIds,
        this.releaseDate,
        this.id,
        this.name,
        this.title,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.voteAverage,
       });

  TvShowsModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<int>();
    releaseDate = json['release_date'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'].toString();
  }

}