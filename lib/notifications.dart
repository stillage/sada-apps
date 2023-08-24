import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:launcher_apps/util/constant.dart';
import 'package:launcher_apps/widget/grid_app.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotificationsUser extends StatefulWidget {
  const NotificationsUser({Key? key}) : super(key: key);

  @override
  State<NotificationsUser> createState() => _NotificationsUserState();
}

class _NotificationsUserState extends State<NotificationsUser> {
  ChromeSafariBrowser browser = MyChromeSafariBrowser();
  var options = ChromeSafariBrowserClassOptions(
      android: AndroidChromeCustomTabsOptions(
          shareState: CustomTabsShareState.SHARE_STATE_OFF),
      ios: IOSSafariOptions(barCollapsingEnabled: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: COLOR_PRIMARY_BLUE,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView(
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                15,
                (index) => ListTile(
                  title: Text('Item'),
                  onTap: () async {
                    await browser.open(
                      url: Uri.parse("https://www.google.com/"),
                      options: options,
                    );
                  },
                ),
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
