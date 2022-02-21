import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:prandana_movie_info/domain/dataproviders/api_client/api_client.dart';
import 'package:prandana_movie_info/domain/models/movie.dart';
import 'package:prandana_movie_info/domain/models/popular_movie_response.dart';

import '../../main_navigation.dart';

class MovieListProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadInProgress = false;
  String? _searchQuery;
  Timer? searchDebounce;

  List<Movie> get movies => _movies;
  late DateFormat _dateFormat;
  String _locale = '';

  String stringFormatDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  void setupLocaleAndLoadData(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(_locale);
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await _loadNextPage();
  }

  Future<PopularMovieResponse> _loadMovie(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.getPopularMovies(nextPage, _locale);
    } else {
      return await _apiClient.searchMovies(nextPage, locale, query);
    }
  }

//человек
  Future<void> _loadNextPage() async {
    if (_isLoadInProgress || _currentPage >= _totalPage) return;
    _isLoadInProgress = true;
    final nextPage = _currentPage + 1;

    await _loadMovie(nextPage, _locale).then((movieResponse) {
      _currentPage = movieResponse.page;
      _totalPage = movieResponse.totalPages;
      _movies.addAll(movieResponse.movies);
      _isLoadInProgress = false;
      notifyListeners();
    });
  }

  void searchMovie(String text) async {
    // searchDebounce bu taymer, yani xar search qilganda xar bosgan xarfiga orasiga
    // 450 millisekund vaqd qoyadi, yani xar bir xarfga serverga bormaydida 450 millsekunda boradi, bu paty
    // user qidiradigan sozini kiritib olishi mumkin, va trafik tejaladi serverga kam borgani uchun
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 450), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void onMovieTap(BuildContext context, int index) {
    final movie = _movies[index];
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: movie,
    );
  }

  void showMovieAtIndex(int index) {
    // oxirgi ochilgan kino indexi movies uzunligidan kichik bolsa loadMovie ishlamaydi
    // agar index katta bolsa bu shart bajarilmay pastga otadi, va _loadMovie ishlaydi
    if (index < _movies.length - 1) return;
    _loadNextPage();
  }
}
