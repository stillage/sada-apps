// To parse this JSON data, do
//
//     final modelImageGetApi = modelImageGetApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelImageGetApi modelImageGetApiFromJson(String str) =>
    ModelImageGetApi.fromJson(json.decode(str));

String modelImageGetApiToJson(ModelImageGetApi data) =>
    json.encode(data.toJson());

class ModelImageGetApi {
  ModelImageGetApi({
    required this.odataContext,
    required this.microsoftGraphDownloadUrl,
    required this.eTag,
    required this.id,
    required this.image,
  });

  String odataContext;
  String microsoftGraphDownloadUrl;
  String eTag;
  String id;
  ImageIconWeb image;

  factory ModelImageGetApi.fromJson(Map<String, dynamic> json) =>
      ModelImageGetApi(
        odataContext: json["@odata.context"],
        microsoftGraphDownloadUrl: json["@microsoft.graph.downloadUrl"],
        eTag: json["eTag"],
        id: json["id"],
        image: ImageIconWeb.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "@microsoft.graph.downloadUrl": microsoftGraphDownloadUrl,
        "eTag": eTag,
        "id": id,
        "image": image.toJson(),
      };
}

class ImageIconWeb {
  ImageIconWeb({
    required this.height,
    required this.width,
  });

  int height;
  int width;

  factory ImageIconWeb.fromJson(Map<String, dynamic> json) => ImageIconWeb(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}


// ModelImageGetApi modelImageGetApiFromJson(String str) =>
//     ModelImageGetApi.fromJson(json.decode(str));

// String modelImageGetApiToJson(ModelImageGetApi data) =>
//     json.encode(data.toJson());

// class ModelImageGetApi {
//   ModelImageGetApi({
//     required this.odataContext,
//     required this.microsoftGraphDownloadUrl,
//     required this.createdDateTime,
//     required this.eTag,
//     required this.id,
//     required this.lastModifiedDateTime,
//     required this.name,
//     required this.webUrl,
//     required this.cTag,
//     required this.size,
//     required this.createdBy,
//     required this.lastModifiedBy,
//     required this.parentReference,
//     required this.file,
//     required this.fileSystemInfo,
//     // required this.image,
//   });

//   String odataContext;
//   String microsoftGraphDownloadUrl;
//   DateTime createdDateTime;
//   String eTag;
//   String id;
//   DateTime lastModifiedDateTime;
//   String name;
//   String webUrl;
//   String cTag;
//   int size;
//   CreatedBy createdBy;
//   LastModifiedBy lastModifiedBy;
//   ParentReference parentReference;
//   FileClass file;
//   FileSystemInfo fileSystemInfo;
//   // Image image;

//   factory ModelImageGetApi.fromJson(Map<String, dynamic> json) =>
//       ModelImageGetApi(
//         odataContext: json["@odata.context"],
//         microsoftGraphDownloadUrl: json["@microsoft.graph.downloadUrl"],
//         createdDateTime: DateTime.parse(json["createdDateTime"]),
//         eTag: json["eTag"],
//         id: json["id"],
//         lastModifiedDateTime: DateTime.parse(json["lastModifiedDateTime"]),
//         name: json["name"],
//         webUrl: json["webUrl"],
//         cTag: json["cTag"],
//         size: json["size"],
//         createdBy: CreatedBy.fromJson(json["createdBy"]),
//         lastModifiedBy: LastModifiedBy.fromJson(json["lastModifiedBy"]),
//         parentReference: ParentReference.fromJson(json["parentReference"]),
//         file: FileClass.fromJson(json["file"]),
//         fileSystemInfo: FileSystemInfo.fromJson(json["fileSystemInfo"]),
//         // image: Image.fromJson(json["image"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "@odata.context": odataContext,
//         "@microsoft.graph.downloadUrl": microsoftGraphDownloadUrl,
//         "createdDateTime": createdDateTime.toIso8601String(),
//         "eTag": eTag,
//         "id": id,
//         "lastModifiedDateTime": lastModifiedDateTime.toIso8601String(),
//         "name": name,
//         "webUrl": webUrl,
//         "cTag": cTag,
//         "size": size,
//         "createdBy": createdBy.toJson(),
//         "lastModifiedBy": lastModifiedBy.toJson(),
//         "parentReference": parentReference.toJson(),
//         "file": file.toJson(),
//         "fileSystemInfo": fileSystemInfo.toJson(),
//         // "image": image.toJson(),
//       };
// }

// class CreatedBy {
//   CreatedBy({
//     required this.user,
//   });

//   CreatedByUser user;

//   factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
//         user: CreatedByUser.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//       };
// }

// class CreatedByUser {
//   CreatedByUser({
//     required this.displayName,
//   });

//   String displayName;

//   factory CreatedByUser.fromJson(Map<String, dynamic> json) => CreatedByUser(
//         displayName: json["displayName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "displayName": displayName,
//       };
// }

// class FileClass {
//   FileClass({
//     required this.mimeType,
//     required this.hashes,
//   });

//   String mimeType;
//   Hashes hashes;

//   factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
//         mimeType: json["mimeType"],
//         hashes: Hashes.fromJson(json["hashes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "mimeType": mimeType,
//         "hashes": hashes.toJson(),
//       };
// }

// class Hashes {
//   Hashes({
//     required this.quickXorHash,
//   });

//   String quickXorHash;

//   factory Hashes.fromJson(Map<String, dynamic> json) => Hashes(
//         quickXorHash: json["quickXorHash"],
//       );

//   Map<String, dynamic> toJson() => {
//         "quickXorHash": quickXorHash,
//       };
// }

// class FileSystemInfo {
//   FileSystemInfo({
//     required this.createdDateTime,
//     required this.lastModifiedDateTime,
//   });

//   DateTime createdDateTime;
//   DateTime lastModifiedDateTime;

//   factory FileSystemInfo.fromJson(Map<String, dynamic> json) => FileSystemInfo(
//         createdDateTime: DateTime.parse(json["createdDateTime"]),
//         lastModifiedDateTime: DateTime.parse(json["lastModifiedDateTime"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "createdDateTime": createdDateTime.toIso8601String(),
//         "lastModifiedDateTime": lastModifiedDateTime.toIso8601String(),
//       };
// }

// class Image {
//   Image({
//     required this.height,
//     required this.width,
//   });

//   int height;
//   int width;

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         height: json["height"],
//         width: json["width"],
//       );

//   Map<String, dynamic> toJson() => {
//         "height": height,
//         "width": width,
//       };
// }

// class LastModifiedBy {
//   LastModifiedBy({
//     required this.user,
//   });

//   LastModifiedByUser user;

//   factory LastModifiedBy.fromJson(Map<String, dynamic> json) => LastModifiedBy(
//         user: LastModifiedByUser.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//       };
// }

// class LastModifiedByUser {
//   LastModifiedByUser({
//     required this.email,
//     required this.id,
//     required this.displayName,
//   });

//   String email;
//   String id;
//   String displayName;

//   factory LastModifiedByUser.fromJson(Map<String, dynamic> json) =>
//       LastModifiedByUser(
//         email: json["email"],
//         id: json["id"],
//         displayName: json["displayName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "id": id,
//         "displayName": displayName,
//       };
// }

// class ParentReference {
//   ParentReference({
//     required this.driveType,
//     required this.driveId,
//     required this.id,
//     required this.path,
//   });

//   String driveType;
//   String driveId;
//   String id;
//   String path;

//   factory ParentReference.fromJson(Map<String, dynamic> json) =>
//       ParentReference(
//         driveType: json["driveType"],
//         driveId: json["driveId"],
//         id: json["id"],
//         path: json["path"],
//       );

//   Map<String, dynamic> toJson() => {
//         "driveType": driveType,
//         "driveId": driveId,
//         "id": id,
//         "path": path,
//       };
// }


