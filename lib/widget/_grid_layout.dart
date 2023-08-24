import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:launcher_apps/api/app_list.dart';
import 'package:launcher_apps/widget/grid_app.dart';

class GridLayout extends StatelessWidget {
  // AppListHardcode list;
  int count;
  var url;
  // List urlIcon;
  // List appName;
  var accessToken;

  GridLayout({
    Key? key,
    // required this.list,
    required this.count,
    required this.url,
    // required this.urlIcon,
    // required this.appName,
    required this.accessToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 6 / 7,
        // crossAxisSpacing: 2,
        // mainAxisSpacing: 2,
      ),
      // itemCount: listAppModel.value.length,
      itemCount: count,
      itemBuilder: (BuildContext ctx, index) {
        // var imgIcon = imageSupportApiFromJson(
        //     listAppModel.value[index].fields.image);
        // return GridApp(
        //   url: Uri.parse(listAppModel.value[index].fields.appUrl),
        //   urlIcon: imgIcon
        //       .fileName, // sebenarnya yg di by pass nama img utk proses selanjutnya
        //   appName: listAppModel.value[index].fields.title,
        //   accessToken: widget.accessToken,
        // );
        return GridApp(
          url: url[index][1],
          urlIcon: url[index][2],
          appName: url[index][0],
          accessApiKey: accessToken,
        );
      },
    );
  }
}
