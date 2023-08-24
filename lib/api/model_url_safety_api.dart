import 'dart:convert';

ModelUrlSafetyApi modelUrlSafetyApiFromJson(String str) =>
    ModelUrlSafetyApi.fromJson(json.decode(str));

String modelUrlSafetyApiToJson(ModelUrlSafetyApi data) =>
    json.encode(data.toJson());

class ModelUrlSafetyApi {
  ModelUrlSafetyApi({
    required this.data,
  });

  List<Datum> data;

  factory ModelUrlSafetyApi.fromJson(Map<String, dynamic> json) =>
      ModelUrlSafetyApi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.lastLti,
    required this.countDays,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String lastLti;
  int countDays;
  String days;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    lastLti: json["last_lti"],
    countDays: json["count_days"],
    days: json["days"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "last_lti": lastLti,
    "count_days": countDays,
    "days": days,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
