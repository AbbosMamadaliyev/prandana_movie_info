class Credits {
  int id;
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({required this.id, required this.cast, required this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) {
    print('data load: ${json['id']}');
    return Credits(
      id: json['id'],
      cast: ((json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList()),
      crew: ((json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList()),
    );
  }
}

class Cast {
  bool adult;
  int? gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  double popularity;
  String? profile_path;
  int cast_id;
  String character;
  String credit_id;
  int order;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.known_for_department,
    required this.name,
    required this.original_name,
    required this.popularity,
    required this.profile_path,
    required this.cast_id,
    required this.character,
    required this.credit_id,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      known_for_department: json['known_for_department'],
      name: json['name'],
      original_name: json['original_name'],
      popularity: json['popularity'],
      profile_path: json['profile_path'],
      cast_id: json['cast_id'],
      character: json['character'],
      credit_id: json['credit_id'],
      order: json['order'],
    );
  }
}

class Crew {
  bool adult;
  int? gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  double popularity;
  String? profile_path;
  String credit_id;
  String department;
  String job;

  Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.known_for_department,
    required this.name,
    required this.original_name,
    required this.popularity,
    required this.profile_path,
    required this.department,
    required this.credit_id,
    required this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      known_for_department: json['known_for_department'],
      name: json['name'],
      original_name: json['original_name'],
      popularity: json['popularity'],
      profile_path: json['profile_path'],
      department: json['department'],
      credit_id: json['credit_id'],
      job: json['job'],
    );
  }
}
