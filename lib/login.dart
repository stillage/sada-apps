import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launcher_apps/home.dart';
import 'package:launcher_apps/main.dart';
import 'package:launcher_apps/util/constant.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:new_version_plus/new_version_plus.dart';

class LoginApp extends StatefulWidget {
  LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  static final Config config = Config(
    tenant: '995e114e-64fa-456b-bfdc-588e0182e0bf',
    clientId: '168076fb-9e80-46d3-a80c-39be284ac2a3',
    scope: 'openid profile offline_access',
    redirectUri: kIsWeb
        ? 'http://localhost:8483'
        : 'https://login.live.com/oauth20_desktop.srf',
    navigatorKey: navigatorKey,
  );

  final AadOAuth oauth = AadOAuth(config);
  final Token tokenOauth = Token();
  var accessToken;

  @override
  initState() {
    super.initState();

    final newVersion = NewVersionPlus(
        // iOSId: 'com.disney.disneyplus',
        // androidId: 'com.disney.disneyplus',
        iOSId: 'com.agincourtresources.sada',
        androidId: 'com.agincourtresources.sada',
        androidPlayStoreCountry: "id_ID");
    const simpleBehavior = true;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersionPlus newVersion) async {
    final version = await newVersion.getVersionStatus();
    if (version != null) {
      var release = version.releaseNotes ?? "";
      setState(() {});
    }
    newVersion.showAlertIfNecessary(
      context: context,
      launchModeVersion: LaunchModeVersion.external,
    );
  }

  advancedStatusCheck(NewVersionPlus newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: 'Update Available',
          dialogText: 'Please update the app from ' +
              '${status.localVersion}' +
              ' to ' +
              '${status.storeVersion}',
          dismissAction: () {
            SystemNavigator.pop();
          },
          updateButtonText: 'Update',
          dismissButtonText: 'Maybe Later');
    }
  }

  // advancedStatusCheck(NewVersionPlus newVersion) async {
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null) {
  //     debugPrint(status.releaseNotes);
  //     debugPrint(status.appStoreLink);
  //     debugPrint(status.localVersion);
  //     debugPrint(status.storeVersion);
  //     debugPrint(status.canUpdate.toString());
  //     newVersion.showUpdateDialog(
  //         context: context,
  //         versionStatus: status,
  //         dialogTitle: 'Update Available',
  //         dialogText: 'Please update the app from ' + '${status.localVersion}' + ' to ' + '${status.storeVersion}',
  //         dismissAction: () {
  //           SystemNavigator.pop();
  //         },
  //         updateButtonText: 'Update',
  //         dismissButtonText: 'Maybe Later'
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            //area background
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                  color: COLOR_PRIMARY_BLUE,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),

            // area utama
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // area judul
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'SADA',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // area sub judul
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Satu Aplikasi & \nData Agincourt',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // area kontainer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(20)),
                            Image.asset("assets/images/logo_title.jpg"),
                            // const Padding(padding: EdgeInsets.all(20)),
                            // Text(
                            //   "Please Login to Get Started",
                            //   style: TextStyle(
                            //     fontSize:
                            //         MediaQuery.of(context).size.height / 50,
                            //   ),
                            // ),
                            const Padding(padding: EdgeInsets.all(20)),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: COLOR_PRIMARY_BLUE,
                                minimumSize: Size(88, 36),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                              ),
                              onPressed: login,
                              icon: const Icon(
                                FontAwesomeIcons.microsoft,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              label: const Text(
                                  'Login with Your Microsoft Account'), // <-- Text
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const Padding(padding: EdgeInsets.all(20)),

                // area footer
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Copyright \u00a9 ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'PT Agincourt Resources (PTAR)',
                      style: TextStyle(
                        color: COLOR_PRIMARY_BLUE,
                        fontSize: MediaQuery.of(context).size.height / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
                ),

                const Padding(padding: EdgeInsets.all(20)),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
            });
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login() async {
    try {
      await oauth.login();
      accessToken = await oauth.getAccessToken();
      // var idToken = await oauth.getIdToken();

      setState(() {
        // perubahan setelah login lakukan disini
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => Home(
        //       title: 'PTAR Super Apps',
        //     ),
        //   ),
        // );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              title: "SADA",
              accessToken: accessToken,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      });

      await Sentry.captureMessage('Akses Token : $accessToken');

      // showDialog(
      //   context: context,
      //   builder: (c) => AlertDialog(
      //     content:
      //         Text('Logged in successfully, your access token: $accessToken'),
      //   ),
      // );
      // showMessage('Logged in successfully, your access token: $accessToken');
    } catch (e) {
      // showError("$e \n\n You Have To Login Again");
      showMessage(
          "Your are not login OR your session has been expired. Please try to login again.");
      // print(e);
      await oauth.logout();
      await Sentry.captureException(e,
          hint: "HInt : Bagian Login", stackTrace: "Stacktrace : Bagian Login");
    }
  }

  void logout() async {
    setState(() {
      // perubahan setelah logout lakukan disini
    });
    await oauth.logout();
    showMessage('Logged out');
  }

  void cekLogin() {
    if (tokenOauth.hasValidAccessToken()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginApp()),
      );
    }
  }
}
