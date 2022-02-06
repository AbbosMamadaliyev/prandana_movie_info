import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prandana_movie_info/models/credits.dart';
import 'package:prandana_movie_info/models/keywords.dart';
import 'package:prandana_movie_info/models/movie_details.dart';
import 'package:prandana_movie_info/models/popular_actors.dart';
import 'package:prandana_movie_info/models/popular_movie_response.dart';
import 'package:prandana_movie_info/models/videos.dart';

class ApiClient {
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '51c48776654d73a6bb0aaf614c6f0d2e';

  static String imageUrl(String path) => _imageUrl + path;

  // get popular movie
  Future<PopularMovieResponse> getPopularMovies(int page, String locale) async {
    final response = await http.get(Uri.parse(
        '$_host/movie/popular?api_key=$_apiKey&language=$locale&page=$page'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = PopularMovieResponse.fromJson(jsonData);
    print('result movies, 0-index title: ${result.movies[0].title}');
    return result;
  }

  // search movie
  Future<PopularMovieResponse> searchMovies(
      int page, String locale, String query) async {
    final response = await http.get(Uri.parse(
        '$_host/search/movie?api_key=$_apiKey&language=$locale&query=$query&page=$page&include_adult=false'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = PopularMovieResponse.fromJson(jsonData);
    return result;
  }

  // get movie details
  Future<MovieDetails> movieDetails(
    int movieId,
    String locale,
  ) async {
    final response = await http.get(
        Uri.parse('$_host/movie/$movieId?api_key=$_apiKey&language=$locale'));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = MovieDetails.fromJson(jsonData);
    return result;
  }

  // get keywords movies    , /movie/{movie_id}/keywords
  Future<KeywordMovies> getKeywords(
    int movieId,
  ) async {
    final response = await http
        .get(Uri.parse('$_host/movie/$movieId/keywords?api_key=$_apiKey'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = KeywordMovies.fromJson(jsonData);
    return result;
  }

  // /movie/{movie_id}/credits
  Future<Credits> getCredits(
    int movieId,
    String locale,
  ) async {
    final response = await http.get(Uri.parse(
        '$_host/movie/$movieId/credits?api_key=$_apiKey&language=$locale'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = Credits.fromJson(jsonData);
    return result;
  }

  //movie/{movie_id}/videos
  Future<Videos> getVideos(
    int movieId,
    String locale,
  ) async {
    final response = await http.get(Uri.parse(
        '$_host/movie/$movieId/videos?api_key=$_apiKey&append_to_response=videos&language=$locale'));
    https: //api.themoviedb.org/3/movie/634649/videos?api_key=51c48776654d73a6bb0aaf614c6f0d2e&language=ru-RU

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = Videos.fromJson(jsonData);
    return result;
  }

  Future<PopularActors> getPopularActors(
    int page,
    String locale,
  ) async {
    final response = await http.get(Uri.parse(
        '$_host/person/popular?api_key=$_apiKey&append_to_response=videos&language=$locale&page=$page'));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = PopularActors.fromJson(jsonData);
    return result;
  }

  // search movie
  Future<PopularActors> searchPopularActors(
      int page, String locale, String query) async {
    final response = await http.get(Uri.parse(
        '$_host/search/person?api_key=$_apiKey&language=$locale&query=$query&page=$page&include_adult=false'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    final result = PopularActors.fromJson(jsonData);
    return result;
  }
}
