import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/domain/dataproviders/api_client/api_client.dart';
import 'package:prandana_movie_info/domain/models/credits.dart';

class CreditsProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  Credits? _credits;

  Credits? get credits => _credits;

  Future<void> getCredits(int movieId, String locale) async {
    _credits = await _apiClient.getCredits(movieId, locale);
    notifyListeners();
  }
}
