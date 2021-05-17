import 'package:watch_tonight/services/api_client.dart';
import 'package:watch_tonight/models/movie_model.dart';
import 'package:watch_tonight/models/movie_details_model.dart';


class MovieWebService {
  final ApiClient _apiClient;
  MovieWebService(this._apiClient);

  Future <List<MovieModel>> getTrendingDay () async {
    final decodeResponse = await _apiClient.get('/trending/movies/day');
    return decodeResponse;
  }

  Future <List<MovieModel>> getTrendingWeek () async {
    final decodeResponse = await _apiClient.get('/trending/movies/week');
    return decodeResponse;
  }

  Future <List<MovieModel>> getPopular () async {
    final decodeResponse = await _apiClient.get('/movie/popular');
    return decodeResponse;
  }

  Future <List<MovieModel>> getComingSoon () async {
    final decodeResponse = await _apiClient.get('/movie/upcoming');
    return decodeResponse;
  }

  Future <MovieDetailsModel> getMovieDetails (int id) async {
    final decodeResponse = await _apiClient.get('/movie/$id');
    return decodeResponse;
  }

}