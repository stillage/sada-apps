// To parse this JSON data, do
//
//     final modelGoldSilverPriceApi = modelGoldSilverPriceApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelGoldSilverPriceApi modelGoldSilverPriceApiFromJson(String str) =>
    ModelGoldSilverPriceApi.fromJson(json.decode(str));

String modelGoldSilverPriceApiToJson(ModelGoldSilverPriceApi data) =>
    json.encode(data.toJson());

class ModelGoldSilverPriceApi {
  ModelGoldSilverPriceApi({
    required this.gold,
    required this.silver,
  });

  List<Gold> gold;
  List<Gold> silver;

  factory ModelGoldSilverPriceApi.fromJson(Map<String, dynamic> json) =>
      ModelGoldSilverPriceApi(
        gold: List<Gold>.from(json["gold"].map((x) => Gold.fromJson(x))),
        silver: List<Gold>.from(json["silver"].map((x) => Gold.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gold": List<dynamic>.from(gold.map((x) => x.toJson())),
        "silver": List<dynamic>.from(silver.map((x) => x.toJson())),
      };
}

class Gold {
  Gold({
    required this.price,
    required this.status,
  });

  String price;
  String status;

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "status": status,
      };
}
