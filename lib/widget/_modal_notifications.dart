import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'grid_app.dart';

class ModalNotifications extends StatelessWidget {
  ModalNotifications({Key? key}) : super(key: key);

  ChromeSafariBrowser browser = MyChromeSafariBrowser();
  var options = ChromeSafariBrowserClassOptions(
      android: AndroidChromeCustomTabsOptions(
          shareState: CustomTabsShareState.SHARE_STATE_OFF),
      ios: IOSSafariOptions(barCollapsingEnabled: true));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: Container(),
            middle: Text('Notifications'),
          ),
          child: SafeArea(
            bottom: false,
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
                                url: Uri.parse("www.google.com"),
                                options: ChromeSafariBrowserClassOptions(
                                    android: AndroidChromeCustomTabsOptions(
                                        shareState: CustomTabsShareState
                                            .SHARE_STATE_OFF),
                                    ios: IOSSafariOptions(
                                        barCollapsingEnabled: true)));
                          },
                        )),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
