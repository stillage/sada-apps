// To parse this JSON data, do
//
//     final modelUrlAppApi = modelUrlAppApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelUrlAppApi modelUrlAppApiFromJson(String str) =>
    ModelUrlAppApi.fromJson(json.decode(str));

String modelUrlAppApiToJson(ModelUrlAppApi data) => json.encode(data.toJson());

class ModelUrlAppApi {
  ModelUrlAppApi({
    required this.data,
  });

  List<Datum> data;

  factory ModelUrlAppApi.fromJson(Map<String, dynamic> json) => ModelUrlAppApi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.link,
    required this.categoryId,
    required this.sortOrder,
    required this.isVisible,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  int id;
  String name;
  String link;
  int categoryId;
  int sortOrder;
  int isVisible;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        categoryId: json["category_id"],
        sortOrder: json["sort_order"],
        isVisible: json["is_visible"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "category_id": categoryId,
        "sort_order": sortOrder,
        "is_visible": isVisible,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int sortOrder;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
