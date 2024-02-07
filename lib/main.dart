import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:musaffa/Views/StockDetailsPage.dart';
import 'package:musaffa/Views/home_view.dart';
import 'package:musaffa/Views/new_home_screen.dart';
import 'package:musaffa/Views/stcok_detail_view.dart';
import 'package:musaffa/Views/stock_screener.dart';
import 'package:musaffa/widgets/details_container_widget.dart';
import 'package:musaffa/widgets/etf_screener_bucket.dart';
import 'package:musaffa/widgets/filter_bottom_sheet_widget.dart';
import 'package:musaffa/firebase_options.dart';

import 'package:musaffa/Views/data_testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeRemoteCofig();
  runApp(const MyApp());
}

void initializeRemoteCofig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  // await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(seconds: 10),
  //   minimumFetchInterval: const Duration(hours: 1),
  // ));
  await remoteConfig.setDefaults({
    "app_features": jsonEncode([
      {
        "title":
            "How to Make Better Investment Decisions Using the Investment Checklist",
        "img":
            "https://academy.musaffa.com/wp-content/uploads/2023/08/Musaffa-Investment-Checklist-1.png",
        "link":
            "https://academy.musaffa.com/how-to-make-better-investment-decisions-using-the-investment-checklist/"
      },
      {
        "title": "How to Check the Halal Status of the Stock",
        "img":
            "https://academy.musaffa.com/wp-content/uploads/2023/08/Check-Halal-Status-of-Your-Favorite-Stock.png",
        "link":
            "https://academy.musaffa.com/how-to-check-the-halal-status-of-the-stock/"
      },
      {
        "title": "How to Screen Halal Stocks Using Musaffa App",
        "img":
            "https://academy.musaffa.com/wp-content/uploads/2023/07/Find-Halal-Stocks-Using-Musaffa-Application.png",
        "link":
            "https://academy.musaffa.com/how-to-screen-halal-stocks-using-musaffa-app/"
      }
    ]),
    "app_feature_countries": jsonEncode([
      {"country": "India", "code": "in"},
      {"country": "United States Of America", "code": "us"},
      {"country": "Canada", "code": "can"},
      {"country": "Australia", "code": "aus"}
    ])
  });
  remoteConfig.onConfigUpdated.listen((event) async {
    log("UPDATE RECEIVED");
    await remoteConfig.activate();

    // Use the new config values here.
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
