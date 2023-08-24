import 'dart:convert';

ModelUrlBannerApi modelUrlBannerApiFromJson(String str) =>
    ModelUrlBannerApi.fromJson(json.decode(str));

String modelUrlBannerApiToJson(ModelUrlBannerApi data) =>
    json.encode(data.toJson());

class ModelUrlBannerApi {
  ModelUrlBannerApi({
    required this.data,
  });

  List<Datum> data;

  factory ModelUrlBannerApi.fromJson(Map<String, dynamic> json) =>
      ModelUrlBannerApi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.ptar,
    required this.contractors,
    required this.martabeSite,
    required this.periode,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int ptar;
  int contractors;
  int martabeSite;
  String periode;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    ptar: json["ptar"],
    contractors: json["contractors"],
    martabeSite: json["martabe_site"],
    periode: json["periode"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ptar": ptar,
    "contractors": contractors,
    "martabe_site": martabeSite,
    "periode": periode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
