import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:launcher_apps/api/api_constant.dart';
import 'package:launcher_apps/api/api_service.dart';
import 'package:launcher_apps/api/model_url_app_api.dart';
import 'package:launcher_apps/api/model_url_app_category_app.dart';
import 'package:launcher_apps/widget/grid_app.dart';

import '../util/constant.dart';
import 'header_section.dart';

class AppCategory extends StatefulWidget {
  ModelUrlAppCategoryApi listUrlAppCategory;

  AppCategory({super.key, required this.listUrlAppCategory});

  @override
  State<AppCategory> createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
  int selectedCategory = 0;

  void setCategory(int categoryId) {
    setState(() {
      selectedCategory = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Application> allApplications = widget.listUrlAppCategory.data
        .expand((category) => category.applications)
        .toList();

    List<Application> filteredApplications = allApplications
        .where((app) => selectedCategory == 0 || app.categoryId == selectedCategory)
        .toList();

    return ListView(
      children: <Widget>[
        // Buttons to filter applications by category
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10), // Add vertical margin
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var category in widget.listUrlAppCategory.data)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8), // Add horizontal margin
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => setCategory(category.id),
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            color: category.id == selectedCategory ? COLOR_PRIMARY_BLUE : Colors.white,
                            borderRadius: BorderRadius.circular(8), // Apply rounded corners
                            border: Border.all(
                              color: COLOR_PRIMARY_BLUE, // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.category,
                                size: 35,
                                color: category.id == selectedCategory ? Colors.white : COLOR_PRIMARY_BLUE,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                category.name,
                                style: TextStyle(
                                  color: category.id == selectedCategory ? Colors.white : COLOR_PRIMARY_BLUE,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20), // Add space between button and text
        const Text(
          "    Applications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: COLOR_PRIMARY_BLUE,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              childAspectRatio: 9 / 12,
            ),
            itemCount: filteredApplications.length,
            itemBuilder: (BuildContext ctx, index) {
              var app = filteredApplications[index];
              return GridApp(
                url: Uri.parse(app.link),
                urlIcon: app.icon,
                appName: app.name,
                accessApiKey: ApiConstants.apiKey,
              );
            },
          ),
        ),
      ],
    );
  }
}
