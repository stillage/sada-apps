import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:launcher_apps/api/api_constant.dart';
import 'package:launcher_apps/api/api_service.dart';
import 'package:launcher_apps/api/model_url_app_api.dart';
import 'package:launcher_apps/api/model_url_app_category_app.dart';
import 'package:launcher_apps/widget/grid_app.dart';

import 'header_section.dart';

class AppCategory extends StatefulWidget {
  final ModelUrlAppCategoryApi listUrlAppCategory;

  const AppCategory({super.key, required this.listUrlAppCategory});

  @override
  State<AppCategory> createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
  List<ModelUrlAppApi> filteredApps = [];
  @override
  void initState() {
    super.initState();
    filterAppsByCategory("Safety");
  }

  void filterAppsByCategory(String categoryName) {
    setState(() {
      List<ModelUrlAppCategoryApi> selectedCategory = widget
          .listUrlAppCategory.data!
          .firstWhere(
            (category) => category.name == categoryName,
            orElse: () => ModelUrlAppCategoryApi(data: []),
          )
          .applications.cast<ModelUrlAppCategoryApi>();

      if (selectedCategory.isNotEmpty) {
        filteredApps = selectedCategory.cast<ModelUrlAppApi>();
      } else {
        filteredApps = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var item in widget.listUrlAppCategory.data)
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  filterAppsByCategory(item.name);
                },
                child: HeaderSection(text: item.name),
              ),
              const SizedBox(
                height: 25,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  childAspectRatio: 9 / 12,
                ),
                // itemCount: listAppModel.value.length,
                itemCount: item.applications.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GridApp(
                    url: Uri.parse(item.applications[index].link),
                    urlIcon: item.applications[index].icon,
                    appName: item.applications[index].name,
                    accessApiKey: ApiConstants.apiKey,
                  );
                },
              ),
            ],
          ),
      ],
    );
  }
}
