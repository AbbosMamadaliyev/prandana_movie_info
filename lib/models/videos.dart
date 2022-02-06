class Videos {
  int id;
  List<Results> results;

  Videos({required this.id, required this.results});

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      id: json['id'],
      results: ((json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList()),
    );
  }
}

class Results {
  String iso_639_1;
  String iso_3166_1;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String published_at;
  String id;

  Results({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.published_at,
    required this.id,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      iso_639_1: json['iso_639_1'],
      iso_3166_1: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      published_at: json['published_at'],
      id: json['id'],
    );
  }
}
