// To parse this JSON data, do
//
//     final modelSlideAnnouncementApi = modelSlideAnnouncementApiFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

ModelSlideAnnouncementApi modelSlideAnnouncementApiFromJson(String str) =>
    ModelSlideAnnouncementApi.fromJson(json.decode(str));

String modelSlideAnnouncementApiToJson(ModelSlideAnnouncementApi data) =>
    json.encode(data.toJson());

class ModelSlideAnnouncementApi {
  ModelSlideAnnouncementApi({
    required this.odataContext,
    required this.value,
  });

  String odataContext;
  List<Value> value;

  factory ModelSlideAnnouncementApi.fromJson(Map<String, dynamic> json) =>
      ModelSlideAnnouncementApi(
        odataContext: json["@odata.context"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    required this.odataEtag,
    required this.createdDateTime,
    required this.eTag,
    required this.id,
    required this.lastModifiedDateTime,
    required this.webUrl,
    required this.createdBy,
    required this.lastModifiedBy,
    required this.parentReference,
    required this.contentType,
    required this.fieldsOdataContext,
    required this.fields,
  });

  String odataEtag;
  DateTime createdDateTime;
  String eTag;
  String id;
  DateTime lastModifiedDateTime;
  String webUrl;
  EdBy createdBy;
  EdBy lastModifiedBy;
  ParentReference parentReference;
  ContentType contentType;
  String fieldsOdataContext;
  Fields fields;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        odataEtag: json["@odata.etag"],
        createdDateTime: DateTime.parse(json["createdDateTime"]),
        eTag: json["eTag"],
        id: json["id"],
        lastModifiedDateTime: DateTime.parse(json["lastModifiedDateTime"]),
        webUrl: json["webUrl"],
        createdBy: EdBy.fromJson(json["createdBy"]),
        lastModifiedBy: EdBy.fromJson(json["lastModifiedBy"]),
        parentReference: ParentReference.fromJson(json["parentReference"]),
        contentType: ContentType.fromJson(json["contentType"]),
        fieldsOdataContext: json["fields@odata.context"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "@odata.etag": odataEtag,
        "createdDateTime": createdDateTime.toIso8601String(),
        "eTag": eTag,
        "id": id,
        "lastModifiedDateTime": lastModifiedDateTime.toIso8601String(),
        "webUrl": webUrl,
        "createdBy": createdBy.toJson(),
        "lastModifiedBy": lastModifiedBy.toJson(),
        "parentReference": parentReference.toJson(),
        "contentType": contentType.toJson(),
        "fields@odata.context": fieldsOdataContext,
        "fields": fields.toJson(),
      };
}

class ContentType {
  ContentType({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory ContentType.fromJson(Map<String, dynamic> json) => ContentType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class EdBy {
  EdBy({
    required this.user,
  });

  User user;

  factory EdBy.fromJson(Map<String, dynamic> json) => EdBy(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.email,
    required this.id,
    required this.displayName,
  });

  String email;
  String id;
  String displayName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "displayName": displayName,
      };
}

class Fields {
  Fields({
    required this.odataEtag,
    required this.id,
    required this.contentType,
    required this.title,
    required this.modified,
    required this.created,
    required this.authorLookupId,
    required this.editorLookupId,
    required this.uiVersionString,
    required this.attachments,
    required this.edit,
    required this.linkTitleNoMenu,
    required this.linkTitle,
    required this.itemChildCount,
    required this.folderChildCount,
    required this.complianceFlags,
    required this.complianceTag,
    required this.complianceTagWrittenTime,
    required this.complianceTagUserId,
    required this.description,
    required this.visibility,
    required this.order0,
  });

  String odataEtag;
  String id;
  String contentType;
  String title;
  DateTime modified;
  DateTime created;
  String authorLookupId;
  String editorLookupId;
  String uiVersionString;
  bool attachments;
  String edit;
  String linkTitleNoMenu;
  String linkTitle;
  String itemChildCount;
  String folderChildCount;
  String complianceFlags;
  String complianceTag;
  String complianceTagWrittenTime;
  String complianceTagUserId;
  String description;
  bool visibility;
  num order0;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        odataEtag: json["@odata.etag"],
        id: json["id"],
        contentType: json["ContentType"],
        title: json["Title"],
        modified: DateTime.parse(json["Modified"]),
        created: DateTime.parse(json["Created"]),
        authorLookupId: json["AuthorLookupId"],
        editorLookupId: json["EditorLookupId"],
        uiVersionString: json["_UIVersionString"],
        attachments: json["Attachments"],
        edit: json["Edit"],
        linkTitleNoMenu: json["LinkTitleNoMenu"],
        linkTitle: json["LinkTitle"],
        itemChildCount: json["ItemChildCount"],
        folderChildCount: json["FolderChildCount"],
        complianceFlags: json["_ComplianceFlags"],
        complianceTag: json["_ComplianceTag"],
        complianceTagWrittenTime: json["_ComplianceTagWrittenTime"],
        complianceTagUserId: json["_ComplianceTagUserId"],
        description: json["Description"],
        visibility: json["Visibility"],
        order0: json["Order0"],
      );

  Map<String, dynamic> toJson() => {
        "@odata.etag": odataEtag,
        "id": id,
        "ContentType": contentType,
        "Title": title,
        "Modified": modified.toIso8601String(),
        "Created": created.toIso8601String(),
        "AuthorLookupId": authorLookupId,
        "EditorLookupId": editorLookupId,
        "_UIVersionString": uiVersionString,
        "Attachments": attachments,
        "Edit": edit,
        "LinkTitleNoMenu": linkTitleNoMenu,
        "LinkTitle": linkTitle,
        "ItemChildCount": itemChildCount,
        "FolderChildCount": folderChildCount,
        "_ComplianceFlags": complianceFlags,
        "_ComplianceTag": complianceTag,
        "_ComplianceTagWrittenTime": complianceTagWrittenTime,
        "_ComplianceTagUserId": complianceTagUserId,
        "Description": description,
        "Visibility": visibility,
        "Order0": order0,
      };
}

class ParentReference {
  ParentReference({
    required this.siteId,
  });

  String siteId;

  factory ParentReference.fromJson(Map<String, dynamic> json) =>
      ParentReference(
        siteId: json["siteId"],
      );

  Map<String, dynamic> toJson() => {
        "siteId": siteId,
      };
}
