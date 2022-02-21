import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/domain/dataproviders/api_client/api_client.dart';
import 'package:prandana_movie_info/domain/models/movie_details.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  String _locale = '';
  MovieDetails? _details;

  String get locale => _locale;

  MovieDetails? get details => _details;

  /* void setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _getDetails(movieId, locale);
  }*/

  Future<void> getDetails(int movieId, String locale) async {
    _details = null;
    _details = await _apiClient.movieDetails(movieId, locale);
    notifyListeners();
  }
}
