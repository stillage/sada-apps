// To parse this JSON data, do
//
//     final modelExchangeRate = modelExchangeRateFromJson(jsonString);

import 'dart:convert';

ModelExchangeRate modelExchangeRateFromJson(String str) =>
    ModelExchangeRate.fromJson(json.decode(str));

String modelExchangeRateToJson(ModelExchangeRate data) =>
    json.encode(data.toJson());

class ModelExchangeRate {
  ModelExchangeRate({
    required this.tanggalBerlaku,
    required this.data,
  });

  String tanggalBerlaku;
  List<Datum> data;

  factory ModelExchangeRate.fromJson(Map<String, dynamic> json) =>
      ModelExchangeRate(
        tanggalBerlaku: json["tanggal_berlaku"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal_berlaku": tanggalBerlaku,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.harga,
    required this.status,
    required this.mataUang,
  });

  String harga;
  String status;
  String mataUang;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        harga: json["harga"],
        status: json["status"],
        mataUang: json["mata_uang"],
      );

  Map<String, dynamic> toJson() => {
        "harga": harga,
        "status": status,
        "mata_uang": mataUang,
      };
}
