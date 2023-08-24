// To parse this JSON data, do
//
//     final modelListAppApi = modelListAppApiFromJson(jsonString);

import 'dart:convert';

ModelListAppApi modelListAppFromJson(String str) =>
    ModelListAppApi.fromJson(json.decode(str));

String modelListAppToJson(ModelListAppApi data) => json.encode(data.toJson());

class ModelListAppApi {
  ModelListAppApi({
    required this.odataContext,
    required this.value,
  });

  String odataContext;
  List<Value> value;

  factory ModelListAppApi.fromJson(Map<String, dynamic> json) =>
      ModelListAppApi(
        odataContext: json["@odata.context"],
        // value: List<Value> != null
        //     ? List<Value>.from(json["value"].map((x) => Value.fromJson(x)))
        //         .toList()
        //     : [],
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
    required this.title,
    required this.id,
    required this.contentType,
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
    required this.appUrl,
    required this.image,
  });

  String odataEtag;
  String title;
  String id;
  String contentType;
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
  String appUrl;
  String image;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        odataEtag: json["@odata.etag"],
        title: json["Title"],
        id: json["id"],
        contentType: json["ContentType"],
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
        appUrl: json["AppURL"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "@odata.etag": odataEtag,
        "Title": title,
        "id": id,
        "ContentType": contentType,
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
        "AppURL": appUrl,
        "Image": image,
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

// ======================================================================================================

// class ModelListAppApi {
//   String? odataContext;
//   List<Value>? value;

//   ModelListAppApi({this.odataContext, this.value});

//   ModelListAppApi.fromJson(Map<String, dynamic> json) {
//     odataContext = json['@odata.context'];
//     if (json['value'] != null) {
//       value = <Value>[];
//       json['value'].forEach((v) {
//         value!.add(new Value.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@odata.context'] = this.odataContext;
//     if (this.value != null) {
//       data['value'] = this.value!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Value {
//   String? odataEtag;
//   String? createdDateTime;
//   String? eTag;
//   String? id;
//   String? lastModifiedDateTime;
//   String? webUrl;
//   CreatedBy? createdBy;
//   CreatedBy? lastModifiedBy;
//   ParentReference? parentReference;
//   ContentType? contentType;
//   String? fieldsOdataContext;
//   Fields? fields;

//   Value(
//       {this.odataEtag,
//       this.createdDateTime,
//       this.eTag,
//       this.id,
//       this.lastModifiedDateTime,
//       this.webUrl,
//       this.createdBy,
//       this.lastModifiedBy,
//       this.parentReference,
//       this.contentType,
//       this.fieldsOdataContext,
//       this.fields});

//   Value.fromJson(Map<String, dynamic> json) {
//     odataEtag = json['@odata.etag'];
//     createdDateTime = json['createdDateTime'];
//     eTag = json['eTag'];
//     id = json['id'];
//     lastModifiedDateTime = json['lastModifiedDateTime'];
//     webUrl = json['webUrl'];
//     createdBy = json['createdBy'] != null
//         ? new CreatedBy.fromJson(json['createdBy'])
//         : null;
//     lastModifiedBy = json['lastModifiedBy'] != null
//         ? new CreatedBy.fromJson(json['lastModifiedBy'])
//         : null;
//     parentReference = json['parentReference'] != null
//         ? new ParentReference.fromJson(json['parentReference'])
//         : null;
//     contentType = json['contentType'] != null
//         ? new ContentType.fromJson(json['contentType'])
//         : null;
//     fieldsOdataContext = json['fields@odata.context'];
//     fields =
//         json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@odata.etag'] = this.odataEtag;
//     data['createdDateTime'] = this.createdDateTime;
//     data['eTag'] = this.eTag;
//     data['id'] = this.id;
//     data['lastModifiedDateTime'] = this.lastModifiedDateTime;
//     data['webUrl'] = this.webUrl;
//     if (this.createdBy != null) {
//       data['createdBy'] = this.createdBy!.toJson();
//     }
//     if (this.lastModifiedBy != null) {
//       data['lastModifiedBy'] = this.lastModifiedBy!.toJson();
//     }
//     if (this.parentReference != null) {
//       data['parentReference'] = this.parentReference!.toJson();
//     }
//     if (this.contentType != null) {
//       data['contentType'] = this.contentType!.toJson();
//     }
//     data['fields@odata.context'] = this.fieldsOdataContext;
//     if (this.fields != null) {
//       data['fields'] = this.fields!.toJson();
//     }
//     return data;
//   }
// }

// class CreatedBy {
//   User? user;

//   CreatedBy({this.user});

//   CreatedBy.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   String? email;
//   String? id;
//   String? displayName;

//   User({this.email, this.id, this.displayName});

//   User.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     id = json['id'];
//     displayName = json['displayName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['id'] = this.id;
//     data['displayName'] = this.displayName;
//     return data;
//   }
// }

// class ParentReference {
//   String? siteId;

//   ParentReference({this.siteId});

//   ParentReference.fromJson(Map<String, dynamic> json) {
//     siteId = json['siteId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['siteId'] = this.siteId;
//     return data;
//   }
// }

// class ContentType {
//   String? id;
//   String? name;

//   ContentType({this.id, this.name});

//   ContentType.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Fields {
//   String? odataEtag;
//   String? title;
//   String? id;
//   String? contentType;
//   String? modified;
//   String? created;
//   String? authorLookupId;
//   String? editorLookupId;
//   String? sUIVersionString;
//   bool? attachments;
//   String? edit;
//   String? linkTitleNoMenu;
//   String? linkTitle;
//   String? itemChildCount;
//   String? folderChildCount;
//   String? sComplianceFlags;
//   String? sComplianceTag;
//   String? sComplianceTagWrittenTime;
//   String? sComplianceTagUserId;
//   String? appURL;
//   String? image;

//   Fields(
//       {this.odataEtag,
//       this.title,
//       this.id,
//       this.contentType,
//       this.modified,
//       this.created,
//       this.authorLookupId,
//       this.editorLookupId,
//       this.sUIVersionString,
//       this.attachments,
//       this.edit,
//       this.linkTitleNoMenu,
//       this.linkTitle,
//       this.itemChildCount,
//       this.folderChildCount,
//       this.sComplianceFlags,
//       this.sComplianceTag,
//       this.sComplianceTagWrittenTime,
//       this.sComplianceTagUserId,
//       this.appURL,
//       this.image});

//   Fields.fromJson(Map<String, dynamic> json) {
//     odataEtag = json['@odata.etag'];
//     title = json['Title'];
//     id = json['id'];
//     contentType = json['ContentType'];
//     modified = json['Modified'];
//     created = json['Created'];
//     authorLookupId = json['AuthorLookupId'];
//     editorLookupId = json['EditorLookupId'];
//     sUIVersionString = json['_UIVersionString'];
//     attachments = json['Attachments'];
//     edit = json['Edit'];
//     linkTitleNoMenu = json['LinkTitleNoMenu'];
//     linkTitle = json['LinkTitle'];
//     itemChildCount = json['ItemChildCount'];
//     folderChildCount = json['FolderChildCount'];
//     sComplianceFlags = json['_ComplianceFlags'];
//     sComplianceTag = json['_ComplianceTag'];
//     sComplianceTagWrittenTime = json['_ComplianceTagWrittenTime'];
//     sComplianceTagUserId = json['_ComplianceTagUserId'];
//     appURL = json['AppURL'];
//     image = json['Image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@odata.etag'] = this.odataEtag;
//     data['Title'] = this.title;
//     data['id'] = this.id;
//     data['ContentType'] = this.contentType;
//     data['Modified'] = this.modified;
//     data['Created'] = this.created;
//     data['AuthorLookupId'] = this.authorLookupId;
//     data['EditorLookupId'] = this.editorLookupId;
//     data['_UIVersionString'] = this.sUIVersionString;
//     data['Attachments'] = this.attachments;
//     data['Edit'] = this.edit;
//     data['LinkTitleNoMenu'] = this.linkTitleNoMenu;
//     data['LinkTitle'] = this.linkTitle;
//     data['ItemChildCount'] = this.itemChildCount;
//     data['FolderChildCount'] = this.folderChildCount;
//     data['_ComplianceFlags'] = this.sComplianceFlags;
//     data['_ComplianceTag'] = this.sComplianceTag;
//     data['_ComplianceTagWrittenTime'] = this.sComplianceTagWrittenTime;
//     data['_ComplianceTagUserId'] = this.sComplianceTagUserId;
//     data['AppURL'] = this.appURL;
//     data['Image'] = this.image;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final modelListAppApi = modelListAppApiFromJson(jsonString);

