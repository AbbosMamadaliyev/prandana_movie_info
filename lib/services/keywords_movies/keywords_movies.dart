import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/models/keywords.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';

class KeywordsProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  KeywordMovies? _keywords;

  KeywordMovies? get keywordMovies => _keywords;

  Future<void> getKeywords(int movieId) async {
    _keywords = null;
    _keywords = await _apiClient.getKeywords(movieId);
    notifyListeners();
  }
}
