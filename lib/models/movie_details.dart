class MovieDetails {
  bool adult;
  String? backdrop_path;
  Object? belongs_to_collection;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  String? imdb_id;
  String original_language;
  String original_title;
  String? overview;
  double popularity;
  String? poster_path;
  List<ProductionCompany> production_companies;
  List<ProductionCountry> production_countries;
  String release_date;
  int revenue;
  int? runtime;
  List<SpokenLanguage> spoken_languages;
  String status;
  String? tagline;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  MovieDetails({
    required this.adult,
    required this.backdrop_path,
    required this.belongs_to_collection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdb_id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.release_date,
    required this.revenue,
    required this.runtime,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      status: json['status'],
      overview: json['overview'],
      vote_average: json['vote_average'],
      release_date: json['release_date'],
      popularity: json['popularity'],
      runtime: json['runtime'],
      imdb_id: json['imdb_id'],
      belongs_to_collection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'],
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      poster_path: json['poster_path'],
      production_companies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      production_countries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['id'],
      spoken_languages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      vote_count: json['vote_count'],
    );
  }
}

class ProductionCompany {
  int id;
  String? logo_path;
  String name;
  String origin_country;

  ProductionCompany(
      {required this.id,
      this.logo_path,
      required this.name,
      required this.origin_country});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logo_path: json['logo_path'],
      name: json['name'],
      origin_country: json['origin_country'],
    );
  }
}

class ProductionCountry {
  String iso_3166_1;
  String name;

  ProductionCountry({required this.iso_3166_1, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso_3166_1: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguage {
  String iso_639_1;
  String name;

  SpokenLanguage({required this.iso_639_1, required this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      iso_639_1: json['iso_639_1'],
      name: json['name'],
    );
  }
}

class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
