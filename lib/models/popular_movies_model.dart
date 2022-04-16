class PopularMovies {
  late List<PopularMoviesModel> _popularMovies;

  List<PopularMoviesModel> get popularMovies => _popularMovies;

  PopularMovies(
      { required popularMovies}){

    this._popularMovies = popularMovies;
  }

  PopularMovies.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _popularMovies = <PopularMoviesModel>[];
      json['results'].forEach((v) {
        _popularMovies.add(new PopularMoviesModel.fromJson(v));
      });
    }
  }
}

class PopularMoviesModel {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? firstAirDate;
  String? title;
  String ? name;
  String? voteAverage;

  PopularMoviesModel(
      {
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.firstAirDate,
        this.title,
        this.name,
        this.voteAverage,
     });

  PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    firstAirDate = json['first_air_date'];
    title = json['title'];
    name = json['name'];
    voteAverage = json['vote_average'].toString();
  }
}