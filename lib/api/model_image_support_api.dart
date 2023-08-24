// To parse this JSON data, do
//
//     final imageShowApi = imageShowApiFromJson(jsonString);

// digunakan untuk api pembantu mendapatkan nama image guna di eksekusi di pemanggilan model_image_get_api

import 'package:meta/meta.dart';
import 'dart:convert';

ImageSupportApi imageSupportApiFromJson(String str) =>
    ImageSupportApi.fromJson(json.decode(str));

String imageSupportApiToJson(ImageSupportApi data) =>
    json.encode(data.toJson());

class ImageSupportApi {
  ImageSupportApi({
    required this.type,
    required this.fileName,
    required this.nativeFile,
    required this.fieldName,
    required this.serverUrl,
    required this.fieldId,
    required this.serverRelativeUrl,
    required this.id,
  });

  String type;
  String fileName;
  NativeFile nativeFile;
  String fieldName;
  String serverUrl;
  String fieldId;
  String serverRelativeUrl;
  String id;

  factory ImageSupportApi.fromJson(Map<String, dynamic> json) =>
      ImageSupportApi(
        type: json["type"],
        fileName: json["fileName"],
        nativeFile: NativeFile.fromJson(json["nativeFile"]),
        fieldName: json["fieldName"],
        serverUrl: json["serverUrl"],
        fieldId: json["fieldId"],
        serverRelativeUrl: json["serverRelativeUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "fileName": fileName,
        "nativeFile": nativeFile.toJson(),
        "fieldName": fieldName,
        "serverUrl": serverUrl,
        "fieldId": fieldId,
        "serverRelativeUrl": serverRelativeUrl,
        "id": id,
      };
}

class NativeFile {
  NativeFile();

  factory NativeFile.fromJson(Map<String, dynamic> json) => NativeFile();

  Map<String, dynamic> toJson() => {};
}
