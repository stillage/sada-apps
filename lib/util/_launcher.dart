import 'package:url_launcher/url_launcher.dart';

class LauncherApp {
  Future<void> launchInApp(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw 'Could not launch $url';
    }
  }
}
