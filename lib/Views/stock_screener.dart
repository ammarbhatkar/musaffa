// ignore_for_file:

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musaffa/Views/StockDetailsPage.dart';
import 'package:musaffa/Views/home_view.dart';
import 'package:musaffa/Views/stcok_detail_view.dart';
import 'package:musaffa/api/fetching_data_from_remote_config.dart';
import 'package:musaffa/models/etf_screener_model.dart';
import 'package:musaffa/widgets/etf_screener_bucket.dart';
import 'package:musaffa/widgets/filter_bottom_sheet_widget.dart';
import 'package:musaffa/models/musaffa_countries_model.dart';
import 'package:musaffa/models/stock_screener_bucket_model.dart';
import 'package:musaffa/widgets/stock_screener_bucket_widget.dart';

class StockScreenerPage extends StatefulWidget {
  StockScreenerPage({
    super.key,
    this.country,
    required this.selectedCountryCode,
  });
  String? country;
  final String selectedCountryCode;

  @override
  State<StockScreenerPage> createState() => _StockScreenerPageState();
}

class _StockScreenerPageState extends State<StockScreenerPage>
    with TickerProviderStateMixin {
  StockScreenerBucketModel? stockScreenerData;
  EtfScreenerModel? etfScreenerData;
  String selectedCountry = "India";
  String selectedCountryCode = "IN";
  List<CountriesModel> fetchCountriesList = [];
  bool isLoading = true;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    if (widget.country != null) {
      selectedCountry = widget.country!;
    }
    tabController = TabController(length: 2, vsync: this);
    fetchStocks();
    fetchEtf();
    // print(FirebaseRemoteConfig.instance.getString("app_feature_countries"));
    print(fetchCountriesList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                  child: Stack(children: [
                    Container(
                      height: 84,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 249, 242),
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 204, 202, 202)))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_sharp,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 11, 11, 10),
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 247, 252, 248),
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 227, 227))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            9, 9, 8, 8),
                                        child: Icon(
                                          Icons.search,
                                          size: 14,
                                          color:
                                              Color.fromARGB(255, 27, 173, 78),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 62.5, 0, 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TabBar(
                            controller: tabController,
                            indicator: BoxDecoration(
                                color: Color.fromARGB(255, 27, 173, 78)),
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 14),
                                  child: Text(
                                    "Stock Screener",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 14),
                                  child: Text(
                                    "ETF Screener",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
                ),

                GestureDetector(
                  onTap: () async {
                    final result = await showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                      isDismissible: true,
                      enableDrag: true,
                      context: context,
                      builder: (context) {
                        return BottomSheetWidget();
                      },
                    );
                    print(result);
                    if (result != null) {
                      final country = result['country'];
                      final countryCode = result['SelectedCountryCode'];
                      print("countryCode = $countryCode");
                      // Use the received data as needed
                      setState(() {
                        //  /   selectedCountry = result['country'];
                        selectedCountryCode = countryCode;
                        selectedCountry = country;
                      });
                      fetchStocks();
                      fetchEtf();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(00, 0, 0, 0),
                    child: Container(
                        margin: EdgeInsets.fromLTRB(160, 0, 16, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 27, 173, 78),
                          border: Border.all(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(6, 4, 0, 5),
                                child: Icon(
                                  Icons.flag_circle,
                                  size: 25,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 8, 0, 9),
                                  child: Text(
                                    selectedCountry,
                                    style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 11.31, 10.8, 12.31),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 10.39,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),

                SizedBox(
                  height: 0,
                ),

                Flexible(
                  child: Container(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Stack(children: [
                          Visibility(
                            visible: !isLoading,
                            child: stockScreenerData?.hits?.isNotEmpty == true
                                ? Container(
                                    color: Colors.amber,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount:
                                            stockScreenerData?.hits?.length,
                                        itemBuilder: (context, index) {
                                          final obj =
                                              stockScreenerData?.hits?[index];
                                          final tickerIsmain =
                                              obj?.document?.tickerIsMain;
                                          final countryCode =
                                              obj?.document?.country;
                                          final finnnHubIndustry = obj
                                              ?.document?.finnhubIndustry
                                              .toString();
                                          final complainceStatus = obj
                                                  ?.document
                                                  ?.shariahCompliantStatus
                                                  .toString ??
                                              "";
                                          final stockRating =
                                              obj?.document?.compliantRanking ??
                                                  0;
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StockDetailView(
                                                          tickerIsMain:
                                                              tickerIsmain
                                                                  .toString(),
                                                          countryCode:
                                                              countryCode
                                                                  .toString(),
                                                          finnHubIndustry:
                                                              finnnHubIndustry
                                                                  .toString(),
                                                          status:
                                                              complainceStatus
                                                                  .toString(),
                                                          ranking: stockRating
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: StockScreenerBucket(
                                              companyName:
                                                  obj?.document?.name ?? "",
                                              companyTicker:
                                                  obj?.document?.ticker ?? "",
                                              currentPrice:
                                                  obj?.document?.currentPrice ??
                                                      0.0,
                                              stockStatus: obj?.document
                                                      ?.shariahCompliantStatus
                                                      .toString() ??
                                                  "",
                                              changePrice:
                                                  obj?.document?.change ?? 0.0,
                                              compliantRankings: obj?.document
                                                      ?.compliantRanking ??
                                                  0,
                                              logoCompany: obj?.document?.logo
                                                      .toString() ??
                                                  "",
                                            ),
                                          );

                                          // return StockScreenerBucket(
                                          //     companyName: obj?.document?.ticker ?? ");
                                          //return StockScreenerBucket();"
                                        }),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                          Visibility(
                            visible: isLoading,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ]),

                        // child: StockScreenerBucket()

                        //}

                        //  ),

                        //StockScreenerBucket(),
                        Container(
                          child: Stack(
                            children: [
                              Visibility(
                                visible: !isLoading,
                                child: etfScreenerData?.hits?.isNotEmpty == true
                                    ? ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount:
                                            etfScreenerData?.hits?.length,
                                        itemBuilder: (context, index) {
                                          final obj =
                                              etfScreenerData?.hits?[index];
                                          return EtfScreenerBucket(
                                            stockStatus: obj
                                                    ?.document?.shariahStates
                                                    .toString() ??
                                                "",
                                            companyName:
                                                obj?.document?.name ?? "",
                                            mainSymbol:
                                                obj?.document?.mainSymbol ?? "",
                                            currentPrice:
                                                obj?.document?.currentPrice ??
                                                    0.0,
                                            changePrice:
                                                obj?.document?.percentChange ??
                                                    0.0,
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Text("Data Not Available"),
                                      ),
                              ),
                              Visibility(
                                visible: isLoading,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // Existing TabBar code
              ]),
        ),
      ]),
    );
  }

  Future<void> fetchStocks() async {
    setState(() {
      isLoading = true; // Set isLoading to true when fetching data
    });

    //print("widget.selectedCountryCode");
    //print(widget.selectedCountryCode);
    final response = await FeaturesApi.fetchStockScreenerBucket(
        selectedCountryCode.toString());
    print(response);

    setState(() {
      stockScreenerData = response;
      isLoading = false;
      // Update the fetchingList with the fetched data
    });
  }

  Future<void> fetchEtf() async {
    setState(() {
      isLoading = true;
      // Set isLoading to true when fetching data
    });

    final response =
        await FeaturesApi.fetchEtfScreener(selectedCountryCode.toString());
    print(response);
    setState(() {
      etfScreenerData = response;
      isLoading = false;
    });
  }
}
