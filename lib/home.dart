import 'dart:developer';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:launcher_apps/api/model_exchange_rate_api.dart';
import 'package:launcher_apps/api/model_gold_silver_price_api.dart';
import 'package:launcher_apps/api/_model_list_app_api.dart';
import 'package:launcher_apps/api/api_service.dart';
import 'package:launcher_apps/api/model_slide_announce_api.dart';
import 'package:launcher_apps/api/model_url_app_category_app.dart';
import 'package:launcher_apps/api/model_url_banner_api.dart';
import 'package:launcher_apps/api/model_url_safety_api.dart';
import 'package:launcher_apps/login.dart';
import 'package:launcher_apps/main.dart';
import 'package:launcher_apps/notifications.dart';
import 'package:launcher_apps/util/constant.dart';
import 'package:launcher_apps/widget/app_category.dart';
import 'package:launcher_apps/widget/grid_app.dart';
import 'package:launcher_apps/widget/header_section.dart';
import 'package:marquee/marquee.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'api/app_list.dart';
import 'api/model_image_support_api.dart';
import 'api/model_url_app_api.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  final String title;
  var accessToken;
  Home({
    Key? key,
    required this.title,
    required this.accessToken,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final Config config = Config(
    tenant: '995e114e-64fa-456b-bfdc-588e0182e0bf',
    clientId: '37d0b0c3-0f66-40ca-b02c-5dbdd6f85fb5',
    scope: 'openid profile offline_access Sites.Read.All',
    clientSecret: ".HQ8Q~HblXiX19siIHX2Z76FIlIV3l_kwrVfDar2",
    redirectUri: kIsWeb
        ? 'http://localhost:8483'
        : 'https://login.live.com/oauth20_desktop.srf',
    navigatorKey: navigatorKey,
  );

  final AadOAuth oauth = AadOAuth(config);

  ModelGoldSilverPriceApi listGoldSilverPrice =
      ModelGoldSilverPriceApi(gold: [], silver: []);

  ModelExchangeRate listExchangeRate =
      ModelExchangeRate(data: [], tanggalBerlaku: '');

  ModelUrlAppCategoryApi listUrlAppCategory = ModelUrlAppCategoryApi(data: []);

  ModelUrlBannerApi listUrlBanner = ModelUrlBannerApi(data: []);

  ModelUrlSafetyApi listUrlSafety = ModelUrlSafetyApi(data: []);

  bool isLoading = false;
  // AppListHardcode appList = AppListHardcode();

  @override
  initState() {
    super.initState();
    _getDataGSPrice();
    _getDataEx();
    _getBanner();
    _getDataCat();
    _getDataSafety();
  }

  void _getDataGSPrice() async {
    listGoldSilverPrice = (await ApiServiceListApp().getGoldSilverPrice());
    setState(() {
      isLoading = true;
    });
    try {
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            isLoading = false;
          }));
    } catch (e) {
      print(e);
    }
  }

  void _getDataEx() async {
    listExchangeRate = (await ApiServiceListApp().getModelExchangeRate());
    setState(() {
      isLoading = true;
    });
    try {
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            isLoading = false;
          }));
    } catch (e) {
      print(e);
    }
  }

  void _getBanner() async {
    listUrlBanner = (await ApiServiceListApp().getListDataBanner());
    setState(() {
      isLoading = true;
    });
    try {
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            isLoading = false;
          }));
    } catch (e) {
      print(e);
    }
  }

  void _getDataSafety() async {
    listUrlSafety = (await ApiServiceListApp().getListDataSafety());
    setState(() {
      isLoading = true;
    });
    try {
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            isLoading = false;
          }));
    } catch (e) {
      print(e);
    }
  }

  void _getDataCat() async {
    listUrlAppCategory = (await ApiServiceListApp().getListDataCategory());
    setState(() {
      isLoading = true;
    });
    try {
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            isLoading = false;
          }));
    } catch (e) {
      print(e);
    }
  }

  // Carousel
  int _current = 0;
  final CarouselController _controller = CarouselController();
  String formatNumber(int number) {
    return NumberFormat.decimalPattern().format(number);
  }

  String formatDateToFull(String dateStr) {
    DateTime date = DateTime.tryParse(dateStr) ?? DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return formattedDate;
  }


  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    List<CarouselItemData> carouselItems = [
      CarouselItemData(
          header:
              "Manhours LTI Free - ${listUrlBanner.data.isNotEmpty ? listUrlBanner.data[0].periode : 'Loading'} 2023",
          footer: "",
          value:
              "PTAR : ${listUrlBanner.data.isNotEmpty ? NumberFormat.decimalPattern().format(listUrlBanner.data[0].ptar) : 'Loading'}"),
      CarouselItemData(
          header:
              "Manhours LTI Free - ${listUrlBanner.data.isNotEmpty ? listUrlBanner.data[0].periode : 'Loading'} 2023",
          footer: "",
          value:
              "Contractors : ${listUrlBanner.data.isNotEmpty ? NumberFormat.decimalPattern().format(listUrlBanner.data[0].contractors) : 'Loading'}"),
      CarouselItemData(
          header:
              "Manhours LTI Free - ${listUrlBanner.data.isNotEmpty ? listUrlBanner.data[0].periode : 'Loading'} 2023",
          footer: "",
          value:
              "Martabe Site : ${listUrlBanner.data.isNotEmpty ? NumberFormat.decimalPattern().format(listUrlBanner.data[0].martabeSite) : 'Loading'}"),
      CarouselItemData(
          header: "Martabe Safe Days",
          footer:
              "Last LTI : ${DateFormat('dd MMMM yyyy').format(yesterday)}",
          value:
              "${listUrlSafety.data.isNotEmpty ? NumberFormat.decimalPattern().format(listUrlSafety.data[0].countDays) : 'Loading'} Days"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: COLOR_PRIMARY_BLUE,
        leading: IconButton(
          icon: Image.asset('assets/images/logo-atas.jpg'),
          onPressed: () {},
        ),
        actions: <Widget>[
          // InkWell(
          //   onTap: () {
          //     // setState(() {
          //     //   jmlNotif++;
          //     // });
          //     // showMaterialModalBottomSheet(
          //     //   context: context,
          //     //   builder: (context) => ModalNotifications(),
          //     // );
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => NotificationsUser()));

          //     Navigator.of(context).push(_routeNotifications());
          //   },
          //   child: Badge(
          //     badgeContent: Text("$jmlNotif"),
          //     position: BadgePosition.topEnd(top: 5, end: -8),
          //     badgeColor: COLOR_PRIMARY_GOLD,
          //     child: Icon(Icons.notifications),
          //   ),
          // ),
          IconButton(
            icon: isLoading
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _getDataGSPrice();
                _getDataEx();
                _getBanner();
                _getDataCat();
                _getDataSafety();
              });
            },
          ),
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text('Are you sure want to sign out?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color.fromARGB(255, 19, 67, 107),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => logout(),
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 19, 67, 107),
                              ),
                            ),
                          ),
                        ],
                      )))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            flex: 6,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                initialPage: 0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: carouselItems.map((text) {
                return Builder(
                  builder: (BuildContext context) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 207, 160, 82),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  text.header,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  text.value,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 19, 67, 107),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (text.footer != "")
                                  Text(
                                    text.footer,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Marquee(
                text:
                    "Gold : ${listGoldSilverPrice.gold.isNotEmpty ? '${listGoldSilverPrice.gold[0].price} (${listGoldSilverPrice.gold[0].status})' : 'Loading'} & Silver : ${listGoldSilverPrice.silver.isNotEmpty ? '${listGoldSilverPrice.silver[0].price} (${listGoldSilverPrice.silver[0].status})' : 'Loading'} (refers to goldprice.org) | USD/IDR : Rp. ${listExchangeRate.data.length > 0 ? '${listExchangeRate.data[0].harga} (${listExchangeRate.data[0].status})' : 'Loading'} | AUD/IDR : Rp. ${listExchangeRate.data.length > 0 ? '${listExchangeRate.data[1].harga} (${listExchangeRate.data[1].status})' : 'Loading'} | CAD/IDR : Rp. ${listExchangeRate.data.length > 0 ? '${listExchangeRate.data[2].harga} (${listExchangeRate.data[2].status})' : 'Loading'} | AUD/IDR : Rp. ${listExchangeRate.data.length > 0 ? '${listExchangeRate.data[3].harga} (${listExchangeRate.data[3].status})' : 'Loading'} (refers to Tax Rate with validity ${listExchangeRate.tanggalBerlaku}) ",

                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 19, 67, 107)),
                // scrollAxis: Axis.horizontal,
                // crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 50.0,
                velocity: 20.0,
                // pauseAfterRound: Duration(seconds: 0),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                // accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 1000),
                // decelerationCurve: Curves.easeOut,
              ),
            ),
          ),

          // List App
          Expanded(
            flex: 30,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: listUrlAppCategory.data.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      child: const CircularProgressIndicator(),
                    )
                  : AppCategory(
                      listUrlAppCategory: listUrlAppCategory,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Route _routeNotifications() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NotificationsUser(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // ==================== baris function dialog dan login/logout ====================

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

  void logout() async {
    await oauth.logout();
    // showMessage('Logged out');

    setState(() {
      // perubahan setelah logout lakukan disini
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginApp()),
      );
    });

    showDialog(
      context: context,
      builder: (c) => const AlertDialog(
        content: Text('You are now logged out'),
      ),
    );
  }
}

class CarouselItemData {
  final String header;
  final String footer;
  final String value;

  CarouselItemData(
      {required this.header, required this.footer, required this.value});
}
