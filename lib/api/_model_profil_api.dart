// To parse this JSON data, do
//
//     final ModelProfilApi = ModelProfilApiFromJson(jsonString);
// https://app.quicktype.io/

import 'package:meta/meta.dart';
import 'dart:convert';

ModelProfilApi modelProfilApiFromJson(String str) =>
    ModelProfilApi.fromJson(json.decode(str));

String modelProfilApiToJson(ModelProfilApi data) => json.encode(data.toJson());

class ModelProfilApi {
  ModelProfilApi({
    required this.odataContext,
    required this.businessPhones,
    required this.displayName,
    required this.givenName,
    required this.jobTitle,
    required this.mail,
    required this.mobilePhone,
    required this.officeLocation,
    required this.preferredLanguage,
    required this.surname,
    required this.userPrincipalName,
    required this.id,
  });

  String odataContext;
  List<dynamic> businessPhones;
  String displayName;
  String givenName;
  dynamic jobTitle;
  String mail;
  dynamic mobilePhone;
  dynamic officeLocation;
  dynamic preferredLanguage;
  String surname;
  String userPrincipalName;
  String id;

  factory ModelProfilApi.fromJson(Map<String, dynamic> json) => ModelProfilApi(
        odataContext: json["@odata.context"],
        businessPhones:
            List<dynamic>.from(json["businessPhones"].map((x) => x)),
        displayName: json["displayName"],
        givenName: json["givenName"],
        jobTitle: json["jobTitle"],
        mail: json["mail"],
        mobilePhone: json["mobilePhone"],
        officeLocation: json["officeLocation"],
        preferredLanguage: json["preferredLanguage"],
        surname: json["surname"],
        userPrincipalName: json["userPrincipalName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "businessPhones": List<dynamic>.from(businessPhones.map((x) => x)),
        "displayName": displayName,
        "givenName": givenName,
        "jobTitle": jobTitle,
        "mail": mail,
        "mobilePhone": mobilePhone,
        "officeLocation": officeLocation,
        "preferredLanguage": preferredLanguage,
        "surname": surname,
        "userPrincipalName": userPrincipalName,
        "id": id,
      };
}
