// https://blog.codemagic.io/rest-api-in-flutter/ => tutorial dari sini
// https://app.quicktype.io/

// https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:launcher_apps/api/api_constant.dart';
import 'package:launcher_apps/api/model_exchange_rate_api.dart';
import 'package:launcher_apps/api/model_image_get_api.dart';
import 'package:launcher_apps/api/_model_list_app_api.dart';
import 'package:launcher_apps/api/model_slide_announce_api.dart';
import 'package:launcher_apps/api/model_url_app_category_app.dart';
import 'package:launcher_apps/api/model_url_banner_api.dart';
import 'package:launcher_apps/api/model_url_safety_api.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'model_gold_silver_price_api.dart';
import 'model_image_support_api.dart';
import 'model_url_app_api.dart';

class ApiServiceListApp {
//   Future<ModelListAppApi> getListData(String token) async {
//     try {
//       var url = Uri.parse(ApiConstants.listApp);
//       var response = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       // log(token);

//       if (response.statusCode == 200) {
//         // log("berhasil akses api");
//         // log('kode respon body : ${response.body}');
//         final modelListAppApi = modelListAppFromJson(response.body);

//         // log('image -> ${modelListAppApi.value[0].fields.image}');
//         // final imageShowApi =
//         //     imageShowApiFromJson(modelListAppApi.value[0].fields.image);
//         // String url = imageShowApi.serverUrl + imageShowApi.serverRelativeUrl;
//         // log('image URL Asli -> $url');

//         await Sentry.captureMessage(
//             'BERHASIL di modelListAppApi - kode respon status : ${response.statusCode} \n${response.body}');

//         return modelListAppApi;
//       } else {
//         log('kode respon status : ${response.statusCode}');
//         await Sentry.captureMessage(
//             'GAGAL di modelListAppApi - kode respon status : ${response.statusCode} \n${response.body}');
//       }
//     } catch (e) {
//       log("error ModelListAppApi service " + e.toString());
//       await Sentry.captureException(e,
//           hint: "HInt : Bagian ModelListAppApi",
//           stackTrace: "Stacktrace : Bagian ModelListAppApi");
//     }

//     throw Exception("Error on server");
//   }

//   Future<ModelImageGetApi> getImageIcon(
//       String token, String urlTambahan) async {
//     try {
//       var url = Uri.parse(ApiConstants.urlIconGet + urlTambahan);
//       var response = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       if (response.statusCode == 200) {
//         // log("berhasil akses api");
//         // log('kode respon body getImageIcon api_service.dart : ${response.body}');
//         final modelImageApi = modelImageGetApiFromJson(response.body);

//         await Sentry.captureMessage(
//             'BERHASIL di ModelImageGetApi - kode respon status : ${response.statusCode} \n${response.body}');
//         return modelImageApi;
//       } else {
//         log('kode respon status : ${response.statusCode}');
//         await Sentry.captureMessage(
//             'GAGAL di ModelImageGetApi - kode respon status : ${response.statusCode} \n${response.body}');
//       }
//     } catch (e) {
//       log("error ModelImageGetApi service " + e.toString());
//       await Sentry.captureException(e,
//           hint: "HInt : Bagian ModelImageGetApi",
//           stackTrace: "Stacktrace : Bagian ModelImageGetApi");
//     }

//     throw Exception("Error on server");
//   }

//   Future<ModelSlideAnnouncementApi> getListAnnouncement(String token) async {
//     try {
//       var url = Uri.parse(ApiConstants.urlAnnouncement);
//       var response = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       if (response.statusCode == 200) {
//         log("announcement 200");
//         log('kode respon body announcement : ${response.body}');
//         final modelSlideAnnouncementApi =
//             modelSlideAnnouncementApiFromJson(response.body);

//         log("API SERVICE ${modelSlideAnnouncementApi.value[0].fields.description}");
//         await Sentry.captureMessage(
//             'BERHASIL di ModelSlideAnnouncementApi - kode respon status : ${response.statusCode} \n${response.body}');

//         return modelSlideAnnouncementApi;
//       } else {
//         log('kode respon status : ${response.statusCode}');
//         await Sentry.captureMessage(
//             'GAGAL di ModelSlideAnnouncementApi - kode respon status : ${response.statusCode} \n${response.body}');
//       }
//     } catch (e) {
//       log("error ModelSlideAnnouncementApi service " + e.toString());
//       await Sentry.captureException(e,
//           hint: "HInt : Bagian ModelSlideAnnouncementApi",
//           stackTrace: "Stacktrace : Bagian ModelSlideAnnouncementApi");
//     }

//     throw Exception("Error on server");
//   }

  Future<ModelGoldSilverPriceApi> getGoldSilverPrice() async {
    try {
      var url = Uri.parse(ApiConstants.goldsilverprice);
      var response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        log("announcement 200");
        log('kode respon body goldsilverprice : ${response.body}');
        final modelGoldSilverPriceApi =
            modelGoldSilverPriceApiFromJson(response.body);

        return modelGoldSilverPriceApi;
      } else {
        log('kode respon status : ${response.statusCode}');
      }
    } catch (e) {
      log("error ModelGoldSilverPriceApi service " + e.toString());
    }
    throw Exception("Error on server");
  }

  Future<ModelExchangeRate> getModelExchangeRate() async {
    try {
      var url = Uri.parse(ApiConstants.exchangerate);
      var response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        log("announcement 200");
        log('kode respon body exchangerate : ${response.body}');
        final modelExchangeRate = modelExchangeRateFromJson(response.body);

        return modelExchangeRate;
      } else {
        log('kode respon status : ${response.statusCode}');
      }
    } catch (e) {
      log("error ModelExchangeRate service " + e.toString());
    }
    throw Exception("Error on server");
  }

  Future<ModelUrlAppApi> getListData() async {
    try {
      var url = Uri.parse(ApiConstants.appUrl);
      http.Response response = await http
          .get(url, headers: {"X-Authorization": ApiConstants.apiKey});

      if (response.statusCode == 200) {
        final modelURLApp = modelUrlAppApiFromJson(response.body);

        await Sentry.captureMessage(
            'BERHASIL di modelURLApp - kode respon status : ${response.statusCode} \n${response.body}');

        return modelURLApp;
      } else {
        await Sentry.captureMessage(
            'GAGAL di modelURLApp - kode respon status : ${response.statusCode} \n${response.body}');
      }
    } catch (e) {
      // log("error modelURLApp service " + e.toString());
      await Sentry.captureException(e,
          hint: "HInt : Bagian modelURLApp",
          stackTrace: "Stacktrace : Bagian modelURLApp");
    }

    throw Exception("Error on server");
  }

  Future<ModelUrlBannerApi> getListDataBanner() async {
    try {
      var url = Uri.parse(ApiConstants.appbanner);
      http.Response response = await http
          .get(url, headers: {"X-Authorization": ApiConstants.apiKey});

      if (response.statusCode == 200) {
        final modelURLAppBanner = modelUrlBannerApiFromJson(response.body);
        log('kode respon status di Banner : ${response.statusCode}');
        log('kode respon body di Banner : ${response.body}');
        // debugPrint(response.body);
        await Sentry.captureMessage(
            'BERHASIL di modelURLAppBanner - kode respon status : ${response.statusCode} \n${response.body}');

        return modelURLAppBanner;
      } else {
        log('kode respon status : ${response.statusCode}');
        await Sentry.captureMessage(
            'GAGAL di modelURLAppBanner - kode respon status : ${response.statusCode} \n${response.body}');
      }
    } catch (e) {
      log("error Banner service $e");
      await Sentry.captureException(e,
          hint: "HInt : Bagian modelURLAppBannner",
          stackTrace: "Stacktrace : Bagian modelURLAppBanner");
    }

    throw Exception("Error on server");
  }

  Future<ModelUrlSafetyApi> getListDataSafety() async {
    try {
      var url = Uri.parse(ApiConstants.appsafety);
      http.Response response = await http
          .get(url, headers: {"X-Authorization": ApiConstants.apiKeynew});

      if (response.statusCode == 200) {
        final modelURLAppSafety = modelUrlSafetyApiFromJson(response.body);
        log('kode respon status Safety : ${response.statusCode}');
        log('kode respon body Safety : ${response.body}');
        // debugPrint(response.body);
        await Sentry.captureMessage(
            'BERHASIL di modelURLAppSafety - kode respon status : ${response.statusCode} \n${response.body}');

        return modelURLAppSafety;
      } else {
        log('kode respon status : ${response.statusCode}');
        await Sentry.captureMessage(
            'GAGAL di modelURLAppSafety - kode respon status : ${response.statusCode} \n${response.body}');
      }
    } catch (e) {
      log("error Safety service $e");
      await Sentry.captureException(e,
          hint: "HInt : Bagian modelURLAppSafety",
          stackTrace: "Stacktrace : Bagian modelURLAppSafety");
    }

    throw Exception("Error on server");
  }

  Future<ModelUrlAppCategoryApi> getListDataCategory() async {
    try {
      var url = Uri.parse(ApiConstants.appUrlCategories);
      http.Response response = await http
          .get(url, headers: {"X-Authorization": ApiConstants.apiKey});

      if (response.statusCode == 200) {
        final modelURLAppCategory =
            modelUrlAppCategoryApiFromJson(response.body);

        log('kode respon status di modelURLAppCategory : ${response.statusCode}');
        log('kode respon status di modelURLAppCategory : ${response.body}');
        await Sentry.captureMessage(
            'BERHASIL di modelURLAppCategory - kode respon status : ${response.statusCode} \n${response.body}');

        return modelURLAppCategory;
      } else {
        log('kode respon status : ${response.statusCode}');
        await Sentry.captureMessage(
            'GAGAL di modelURLAppCategory - kode respon status : ${response.statusCode} \n${response.body}');
      }
    } catch (e) {
      log("error modelURLAppCategory service " + e.toString());
      await Sentry.captureException(e,
          hint: "HInt : Bagian modelURLAppCategory",
          stackTrace: "Stacktrace : Bagian modelURLAppCategory");
    }

    throw Exception("Error on server");
  }
}
