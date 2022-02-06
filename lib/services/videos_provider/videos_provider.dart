import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/models/videos.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';

class VideosProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  Videos? _videos;

  Videos? get videos => _videos;

  Future<void> getVideos(int movieId, String locale) async {
    _videos = await _apiClient.getVideos(movieId, locale);
    notifyListeners();
  }
}
