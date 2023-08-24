import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_apps/home.dart';
import 'package:launcher_apps/login.dart';
import 'package:launcher_apps/util/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://718c205c56c6440c92794bf64c40c0fe@o4504501648359424.ingest.sentry.io/4504501649539072';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SADA',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'MyriadPro',
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: COLOR_PRIMARY_BLUE),
      ),
      home: LoginApp(),
      // home: Home(title: 'SADA'),
      navigatorKey: navigatorKey,
    );
  }
}
