import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:launcher_apps/api/api_constant.dart';
import 'package:launcher_apps/util/_launcher.dart';

import '../api/api_service.dart';
import '../api/model_image_get_api.dart';

class GridApp extends StatefulWidget {
  LauncherApp launcher = new LauncherApp();
  Uri url;
  String urlIcon;
  String appName = "";
  var accessApiKey;

  // final MyInAppBrowser browser = new MyInAppBrowser();
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  GridApp({
    Key? key,
    required this.url,
    required this.urlIcon,
    required this.appName,
    required this.accessApiKey,
  }) : super(key: key);

  @override
  State<GridApp> createState() => _GridAppState();
}

class _GridAppState extends State<GridApp> {
  // var options = InAppBrowserClassOptions(
  //     crossPlatform: InAppBrowserOptions(hideUrlBar: false),
  //     inAppWebViewGroupOptions: InAppWebViewGroupOptions(
  //         crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  var options = ChromeSafariBrowserClassOptions(
      android: AndroidChromeCustomTabsOptions(
          shareState: CustomTabsShareState.SHARE_STATE_OFF),
      ios: IOSSafariOptions(barCollapsingEnabled: true));

  ModelImageGetApi modelImageGetApi = ModelImageGetApi(
      odataContext: "",
      microsoftGraphDownloadUrl: "",
      eTag: "",
      id: "web.png",
      image: ImageIconWeb(height: 50, width: 50));

  @override
  initState() {
    super.initState();
    // _getImageIcon();
  }

  @override
  Widget build(BuildContext context) {
    // log("token grid_app.dart -> ${widget.accessApiKey}");
    // log("nama file grid_app.dart -> ${widget.urlIcon}");
    // log("img id grid_app.dart -> ${modelImageGetApi.id}");

    // final modelImageGetApi = modelImageGetApiFromJson(jsonString);

    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () async {
          // widget.browser.openUrlRequest(
          //   urlRequest: URLRequest(url: widget.url),
          //   options: options,
          // );

          await widget.browser.open(
              url: widget.url,
              options: ChromeSafariBrowserClassOptions(
                  android: AndroidChromeCustomTabsOptions(
                      shareState: CustomTabsShareState.SHARE_STATE_OFF),
                  ios: IOSSafariOptions(barCollapsingEnabled: true)));
        },
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              child: Image(
                image: CachedNetworkImageProvider(
                  "https://sada-apps.infimedia.co.id/storage/${widget.urlIcon}",
                  headers: {
                    "X-Authorization": ApiConstants.apiKey,
                  },
                ),
              ),
              // child: Image.asset(
              //   'assets/images/${widget.urlIcon}',
              //   height: 40,
              //   width: 40,
              //   // fit: BoxFit.contain,
              // ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Text(
              widget.appName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}
