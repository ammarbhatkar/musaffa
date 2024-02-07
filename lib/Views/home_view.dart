import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musaffa/Views/stock_screener.dart';
import 'package:musaffa/api/fetching_data_from_remote_config.dart';
import 'package:musaffa/firebase_options.dart';
import 'package:musaffa/models/market_news.dart';
import 'package:musaffa/models/musaffa_app_features.dart';
import 'package:musaffa/models/musffa_academy_model.dart';
import 'package:musaffa/widgets/explore_musaffa.dart';
import 'package:musaffa/widgets/market_news.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:typesense/typesense.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Features> fetchingList = [];
  List<Academy> fetchingAcademeyList = [];
  MarketNewsModel? newsData;

  @override
  void initState() {
    super.initState();

    log(FirebaseRemoteConfig.instance.getString("app_title"));
    fetchFeature();
    fetchAcademyFeature();
    print(fetchingAcademeyList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 242, 236),
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                        Color.fromARGB(255, 204, 202, 202)))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 10, 0, 30),
                              child: SvgPicture.asset(
                                'assets/images/musaffalogo.svg',
                                height: 25,
                                width: 97,
                              ),
                            ),

                            Spacer(), // Add Spacer widget to push the icon to the right
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 30),
                              child: Icon(
                                Icons.share_sharp,
                                color: Color.fromARGB(255, 43, 162, 6),
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color.fromARGB(255, 204, 202, 202))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 0, 0, 5),
                                    child: Icon(
                                      Icons.search,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              hintText: 'Search any styles or ETF globally',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              // Adjust the padding as needed
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    child: Text(
                      'Explore Musaffa',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 0.1))),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to new screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StockScreenerPage(
                                      selectedCountryCode:
                                          "selectedCountryCode",
                                    )),
                          );
                        },
                        child: ExploreMusaffa(
                            imagePath: "assets/images/stock-screener.svg",
                            title: "Stock\nScreeners"),
                      ),
                      ExploreMusaffa(
                          imagePath: "assets/images/etf-screener.svg",
                          title: "ETF\nScreeners"),
                      ExploreMusaffa(
                          imagePath: "assets/images/stock-purification.svg",
                          title: "Stock\nPurification")
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    'How the app Works',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 0.1))),
                  height: MediaQuery.of(context).size.height / 3.8,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fetchingList.length,
                      itemBuilder: (context, index) {
                        final fetchingListVar = fetchingList[index];
                        final featureTitle = fetchingListVar.title;
                        final featureImg = fetchingListVar.img;
                        final featuresLink = fetchingListVar.link;
                        return GestureDetector(
                          onTap: () {
                            launchUrlString(featuresLink.toString(),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 0, 0, 30),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(featureImg.toString())),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Container(
                    child: Text(
                      'Musaffa Academy',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.1))),
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fetchingAcademeyList.length,
                        itemBuilder: (context, index) {
                          final listVar = fetchingAcademeyList[index];
                          final title = listVar.title;
                          final img = listVar.img;
                          final link = listVar.link;
                          return GestureDetector(
                            onTap: () {
                              launchUrlString(link.toString(),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(14, 0, 0, 30),
                              child: Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(img.toString())),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Container(
                    child: Text(
                      'Market News',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1160,
              child: MarketNewsWidget(),
            ), //ntainer with content
          ],
        ),
      ]),
    );
  }

  Future<void> fetchFeature() async {
    final response = await FeaturesApi.fetchFeaturesData();

    setState(() {
      fetchingList = response; // Update the fetchingList with the fetched data
    });
    print(response);
  }

  Future<void> fetchAcademyFeature() async {
    final response = await FeaturesApi.fetchMusffaAcademy();

    setState(() {
      fetchingAcademeyList =
          response; // Update the fetchingList with the fetched data
    });
  }

  Future<void> fetchMarketApi() async {
    final response = await FeaturesApi.fetchMarketNews();

    setState(() {
      newsData = response;
      // Update the fetchingList with the fetched data
    });
  }
}
