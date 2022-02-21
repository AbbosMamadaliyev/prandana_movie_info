class PopularActors {
  final int page;
  final List<Actor> results;
  final int totalResults;
  final int totalPages;

  PopularActors(
      {required this.page,
      required this.results,
      required this.totalResults,
      required this.totalPages});

  factory PopularActors.fromJson(Map<String, dynamic> json) {
    return PopularActors(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: (json['results'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Actor {
  String? profile_path;
  String name;
  double popularity;
  List<PlayedMovies> known_for;
  int id;

  Actor(
      {required this.profile_path,
      required this.name,
      required this.popularity,
      required this.known_for,
      required this.id});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      profile_path: json['profile_path'],
      name: json['name'],
      popularity: json['popularity'],
      known_for: (json['known_for'] as List<dynamic>)
          .map((e) => PlayedMovies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PlayedMovies {
  String? backdrop_path;
  String? poster_path;
  num vote_average;
  int id;
  String? title;
  String media_type;
  String overview;

  PlayedMovies({
    required this.backdrop_path,
    required this.poster_path,
    required this.vote_average,
    required this.title,
    required this.id,
    required this.media_type,
    required this.overview,
  });

  factory PlayedMovies.fromJson(Map<String, dynamic> json) {
    return PlayedMovies(
      id: json['id'],
      backdrop_path: json['backdrop_path'],
      media_type: json['media_type'],
      title: json['title'],
      poster_path: json['poster_path'],
      vote_average: json['vote_average'],
      overview: json['overview'],
    );
  }
}
