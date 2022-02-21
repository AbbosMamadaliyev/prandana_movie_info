import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/domain/dataproviders/api_client/api_client.dart';
import 'package:prandana_movie_info/domain/models/popular_actors.dart';

import '../../main_navigation.dart';

class PopularActorsProvider extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _actors = <Actor>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadInProgress = false;
  String? _searchQuery;
  Timer? searchDebounce;

  List<Actor> get actors => _actors;
  String _locale = '';

  void setupLocaleAndLoadData(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _actors.clear();
    await _loadNextPage();
  }

  Future<PopularActors> _loadActor(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.getPopularActors(nextPage, _locale);
    } else {
      return await _apiClient.searchPopularActors(nextPage, locale, query);
    }
  }

//человек
  Future<void> _loadNextPage() async {
    if (_isLoadInProgress || _currentPage >= _totalPage) return;
    _isLoadInProgress = true;
    final nextPage = _currentPage + 1;

    await _loadActor(nextPage, _locale).then((actorResponse) {
      _currentPage = actorResponse.page;
      print('page: $_currentPage');
      _totalPage = actorResponse.totalPages;
      _actors.addAll(actorResponse.results);
      _isLoadInProgress = false;
      notifyListeners();
    });
  }

  void searchActor(String text) async {
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

  void onActorTap(BuildContext context, int index) {
    final actor = _actors[index];
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: actor,
    );
  }

  void showActorAtIndex(int index) {
    // oxirgi ochilgan actor indexi actors uzunligidan kichik bolsa loadActor ishlamaydi
    // agar index katta bolsa bu shart bajarilmay pastga otadi, va _loadActor ishlaydi
    if (index < _actors.length - 1) return;
    _loadNextPage();
  }
}
