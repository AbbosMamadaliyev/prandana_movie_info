class KeywordMovies {
  int id;
  List<Keyword> keywords;

  KeywordMovies({required this.id, required this.keywords});

  factory KeywordMovies.fromJson(Map<String, dynamic> json) {
    return KeywordMovies(
      id: json['id'],
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Keyword {
  int id;
  String name;

  Keyword({required this.id, required this.name});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'],
      name: json['name'],
    );
  }
}
