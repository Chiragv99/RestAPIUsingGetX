import 'dart:convert';



Casts castsFromJson(String str) => Casts.fromJson(json.decode(str));

String castsToJson(Casts data) => json.encode(data.toJson());

class Casts {
  Casts({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory Casts.fromJson(Map<String, dynamic> json) => Casts(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.job,
  });

  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"] == null ? null : json["profile_path"],
    castId: json["cast_id"] == null ? null : json["cast_id"],
    character: json["character"] == null ? null : json["character"],
    creditId: json["credit_id"],
    order: json["order"] == null ? null : json["order"],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath == null ? null : profilePath,
    "cast_id": castId == null ? null : castId,
    "character": character == null ? null : character,
    "credit_id": creditId,
    "order": order == null ? null : order
  };
}

enum Department {
  ACTING,
  CREW,
  DIRECTING,
  PRODUCTION,
  SOUND,
  ART,
  EDITING,
  COSTUME_MAKE_UP,
  CAMERA,
  WRITING,
  VISUAL_EFFECTS,
  CREATOR,
  LIGHTING
}

