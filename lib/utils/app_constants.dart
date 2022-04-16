class AppConstants{

  static const String apiKey = '6f21fbe35c7e9a6bcf79ce261ec16b89';

  static const String baseUrl = 'https://api.themoviedb.org/';

  static const String popularMoviesEndpoint = '3/movie/popular?api_key=$apiKey&language=en-US&page=1';

  static const String topRatedMoviesEndpoint = '3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';

  static const String trendingEndpoint = '3/trending/all/day?api_key=$apiKey';

  static const String popularTvShowsEndpoint = '3/tv/popular?api_key=$apiKey&language=en-US&page=1';

  static const String topRatedTvShowsEndpoint = '3/tv/top_rated?api_key=$apiKey&language=en-US&page=1';

  static const String imgUrl = 'https://image.tmdb.org/t/p/w500';

  static const String imgBackgroundUrl = 'https://image.tmdb.org/t/p/original';

  static const String genresIdEndpoint = '3/genre/movie/list?api_key=$apiKey&language=en-US';

  static const String tvGenresIdEndpoint = '3/genre/tv/list?api_key=$apiKey&language=en-US';

  //tags
  static const String popularMoviesTag = 'popular-movies';
  static const String topRatedMoviesTag = 'top-rated-movies';
  static const String trendingNowTag = 'trending-now';
  static const String popularTvShowsTag = 'popular-tv-shows';
  static const String topRatedTvShowsTag = 'top-rated-tv-shows';
}