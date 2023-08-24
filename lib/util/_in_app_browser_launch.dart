import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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

class InAppBrowserLaunch extends StatefulWidget {
  final Uri url;
  final MyInAppBrowser browser = new MyInAppBrowser();

  InAppBrowserLaunch({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<InAppBrowserLaunch> createState() => _InAppBrowserState();
}

class _InAppBrowserState extends State<InAppBrowserLaunch> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppBrowser Example'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              widget.browser.openUrlRequest(
                  urlRequest: URLRequest(url: widget.url), options: options);
            },
            child: Text("Open InAppBrowser")),
      ),
    );
  }
}
