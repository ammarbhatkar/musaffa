// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musaffa/Views/stock_screener.dart';
import 'package:musaffa/api/fetching_data_from_remote_config.dart';
import 'package:musaffa/models/stock_screener_bucket_model.dart';
import 'package:musaffa/widgets/details_container_chips_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget_s.dart';
import 'package:musaffa/widgets/details_container_widget.dart';
import 'package:musaffa/widgets/inestmentWidget.dart';
import 'package:musaffa/widgets/key_statistics_widgets.dart';
import 'package:musaffa/widgets/latest_news.dart';
import 'package:musaffa/widgets/market_news_widget.dart';
import 'package:musaffa/widgets/news_tab_widget.dart';
import 'package:musaffa/widgets/profile_row_widget.dart';
import 'package:musaffa/widgets/profile_widget.dart';
import 'package:musaffa/widgets/stock_screener_bucket_widget.dart';
import 'package:musaffa/widgets/tab_view_overview_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StockDetailView extends StatefulWidget {
  const StockDetailView({
    super.key,
    required this.tickerIsMain,
    required this.countryCode,
    required this.finnHubIndustry,
    required this.status,
    required this.ranking,
  });

  final String tickerIsMain;
  final String countryCode;
  final String finnHubIndustry;
  final String status;
  final String ranking;
  @override
  State<StockDetailView> createState() => _StockDetailViewState();
}

class _StockDetailViewState extends State<StockDetailView>
    with TickerProviderStateMixin {
  StockScreenerBucketModel? stockScreenerData;
  late TabController tabController;
  late TabController newsTabController;

  final List<ChartData> chartData = [
    ChartData('Halal', 93, Color(0xFF39A939)),
    ChartData('Doutful', 2, Color(0xFFF6AF0D)),
    ChartData('Not Halal', 5, Color(0xFFC70707)),
  ];

  @override
  void initState() {
    // _chartData = getChartData();
    tabController = TabController(length: 4, vsync: this);
    newsTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 249, 242),
                ),
                child: Container(
                    child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StockScreenerPage(
                                  selectedCountryCode: '',
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(19, 22.22, 0, 22.22),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 18, 0, 18),
                    child: Text(
                      "AAPL",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(9, 10, 11, 10),
                        child: Icon(
                          Icons.share,
                          color: Color.fromARGB(255, 27, 173, 78),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ])) // Header
                ),
            ContainerDetailWidget(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 350, 0, 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TabBar(
                      splashBorderRadius: BorderRadius.circular(100),
                      padding: EdgeInsets.zero,
                      controller: tabController,
                      indicator: BoxDecoration(
                        color: Color.fromARGB(255, 27, 173, 78),
                      ),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 13.7,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 13.7,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "News",
                              style: TextStyle(
                                fontSize: 13.7,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Forecast",
                              style: TextStyle(
                                fontSize: 13.7,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Color.fromARGB(255, 251, 249, 242),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView(children: [
                          OverviewWidget(
                            tickerIsMainO: widget.tickerIsMain,
                            countryCodeO: widget.countryCode,
                            finnHubIndustryO: widget.finnHubIndustry,
                            stockStatus: widget.status,
                            stockRating: widget.ranking,
                          ),
                        ]),
                        SingleChildScrollView(
                          child: ProfileWidget(),
                        ),
                        SingleChildScrollView(
                          child: NewsTab(),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Text(
                                      "  Based on AAOIFI standards \nLast updated: October 11, 2021",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 233, 250, 233),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 6, 24, 6),
                                        child: Text(
                                          "Source: 2021 3rd Quarterly Report",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 62, 62, 62),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 24, 30, 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 223, 223, 236),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 199, 7, 7),
                                            border: Border(
                                              right: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 223, 223, 236)),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                19.5, 10, 19.5, 10),
                                            child: Text(
                                              "Revenue",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 247, 247, 250),
                                            border: Border(
                                              right: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 223, 223, 236),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                22.5, 10, 22.5, 10),
                                            child: Text("Securities"),
                                          ),
                                        ),
                                        Container(
                                          color: Color.fromARGB(
                                              255, 247, 247, 250),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24, 10, 24, 10),
                                            child: Text("Debt"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 40, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Business Activity Screening",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Revenue Breakdown",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 133, 133, 133),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 46, 25, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 199, 7, 7),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 6, 15, 6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        3.5, 3.5, 3.5, 3.5),
                                                    child: Icon(
                                                      Icons.close_sharp,
                                                      size: 7,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        7, 0, 0, 0),
                                                child: Text(
                                                  "FAIL",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                                SizedBox(height: 20),
                                Divider(
                                  thickness: 1.5,
                                  indent: 22,
                                  endIndent: 22,
                                ),
                                SizedBox(
                                  height: 190,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: SfCircularChart(
                                          series: <CircularSeries>[
                                            DoughnutSeries<ChartData, String>(
                                              legendIconType:
                                                  LegendIconType.rectangle,
                                              innerRadius: '43',
                                              dataSource: chartData,
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xFF39A939)),
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Halal',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF858585)),
                                                    ),
                                                    Text(
                                                      "95.38" + '%',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xFFF6AF0D)),
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Doubtful',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF858585)),
                                                    ),
                                                    Text(
                                                      "3.69" + '%',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xFFC70707)),
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Not Halal',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xFF858585)),
                                                    ),
                                                    Text(
                                                      "0.93" + "%",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 40, 25, 40),
                                  child: Text(
                                    "Combined revenue from “Doubtful” and “Not Halal” sources must be less than 5% of total revenue to be Shariah compliant.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF858585),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFDFDFEC),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    15), // Set the top-left border radius
                                                topRight: Radius.circular(
                                                    15), // Set the top-right border radius
                                              ),
                                              color: Color(0xFFF7F7FA),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      27, 29, 0, 27),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Revenue Ratio",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF717171),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    "=",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF717171),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "70B",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF717171),
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Container(
                                                        height:
                                                            1, // Adjust the height of the line as needed
                                                        width: 30,

                                                        color: Color(
                                                            0xFF717171), // Adjust the width of the line as needed
                                                        // Set the color of the line
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        "1.00",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF717171),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    "=",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF717171),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    "7.00%",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF717171),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 27, 0, 29),
                                            child: Center(
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Doubtful Revenue + Not Halal Revenue",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF717171),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Container(
                                                      height:
                                                          1, // Adjust the height of the line as needed
                                                      width: 200,

                                                      color: Color(
                                                          0xFF717171), //// Set the color of the line
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      "Total Revenue",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF717171),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color getCustomColor(String category) {
    if (category == 'Halal') {
      return Color.fromARGB(255, 59, 169, 57);
    } else if (category == 'Doutful') {
      return Color.fromARGB(255, 199, 7, 7);
    } else if (category == 'Not Halal') {
      return Color.fromARGB(255, 246, 175, 13);
    } else {
      return Colors.blue; // Set a default color for other categories, if needed
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final num y;
  final Color color;
}
// // }
//  legendItemBuilder:
//                                           (name, series, point, index) {
//                                         return SizedBox(
//                                           height: 20,
//                                           width: 20,
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.red,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                           ),
//                                         );
//                                       },
