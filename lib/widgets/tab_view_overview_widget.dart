// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:musaffa/api/fetching_data_from_remote_config.dart';
import 'package:musaffa/models/stock_screener_bucket_model.dart';
import 'package:musaffa/widgets/inestmentWidget.dart';
import 'package:musaffa/widgets/key_statistics_widgets.dart';
import 'package:musaffa/widgets/stock_screener_bucket_widget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({
    super.key,
    required this.tickerIsMainO,
    required this.countryCodeO,
    required this.finnHubIndustryO,
    required this.stockStatus,
    required this.stockRating,
  });

  final String tickerIsMainO;
  final String countryCodeO;
  final String finnHubIndustryO;
  final String stockStatus;
  final String stockRating;
  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  StockScreenerBucketModel? halalStock;

  @override
  void initState() {
    super.initState();
    fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 23, 0, 1.74),
                        child: Text(
                          "Shariah Compliance Status",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 22.79, 10, 0),
                        child: Image.asset('assets/images/Vector.png'),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(56, 24, 56, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 247, 233),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "Halal",
                              style: TextStyle(
                                fontSize: 22.26,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 144, 0),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(40, 0.62, 40, 16.49),
                            child: SmoothStarRating(
                              starCount: 5,
                              size: 15.9,
                              color: Color.fromARGB(255, 0, 144, 0),
                              borderColor: Color.fromARGB(255, 0, 144, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 24, 34, 36),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 144, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(45, 14, 45, 14),
                        child: Text(
                          "Sreening Results",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 20, 17, 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 23, 00, 0),
                    child: Text(
                      "Investment Checklist",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 23, 11.36, 0),
                    child: Image.asset('assets/images/investmentSufiix.png'),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 24, 32, 0),
                child: InvestmentContainerWidget(
                  icon: Icons.arrow_drop_up_sharp,
                  iconSize: 12,
                  title: '54% Expected Annual Return ',
                  subTitle:
                      'Based on 1 year median target stock price of \$645 and annual dividend yeild of 2% ',
                  iconContainerColor: Color.fromARGB(255, 225, 247, 233),
                  iconColor: Color.fromARGB(255, 0, 144, 0),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 32, 0),
                child: InvestmentContainerWidget(
                  icon: Icons.error_outline_outlined,
                  iconSize: 12,
                  title: 'High Risk',
                  subTitle: 'This stock is 1.25x as volitile as the S&P500',
                  iconContainerColor: Color.fromARGB(255, 253, 241, 241),
                  iconColor: Colors.red,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 32, 0),
                child: InvestmentContainerWidget(
                    icon: Icons.calculate_sharp,
                    iconSize: 12,
                    title: 'Good Sharpe Ratio',
                    subTitle:
                        'This stock has a Sharpe ratio of 1.5 and expected to give good returns compared to the risk involved.',
                    iconContainerColor: Color.fromARGB(255, 250, 243, 228),
                    iconColor: Color.fromARGB(255, 235, 166, 8)),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 32, 0),
                child: InvestmentContainerWidget(
                  icon: Icons.arrow_drop_down,
                  iconSize: 12,
                  title: '2.04% Dividend Yeild',
                  subTitle:
                      'This stock offers lower dividend yeild compared to the market ',
                  iconContainerColor: Color.fromARGB(255, 250, 243, 228),
                  iconColor: Colors.red,
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 20, 19, 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 00, 0, 0),
                      child: Text(
                        "Key Statistics",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 00, 15, 0),
                      child: Image.asset('assets/images/companyProfile.png'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 23, 0, 0),
                  child: Text(
                    "Today's Range",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 144, 144, 144)),
                  ),
                ),
                SfSlider(
                  inactiveColor: Color.fromARGB(255, 226, 246, 226),
                  activeColor: Colors.green,
                  value: 0.1,
                  onChanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 00, 0),
                      child: Text(
                        "\$325",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text(
                        "\$52.56",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 19, 00, 0),
                  child: Text(
                    "52 Week Range",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 144, 144, 144)),
                  ),
                ),
                SfSlider(
                  inactiveColor: Color.fromARGB(255, 226, 246, 226),
                  activeColor: Colors.green,
                  value: 0.5,
                  onChanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 00, 0),
                      child: Text(
                        "\$325",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text(
                        "\$52.56",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: KeyStatsContainer(
                          text: "Todays Open", value: "\$45.85"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                      child: KeyStatsContainer(
                        text: "Market Cap",
                        value: "2.67T",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: KeyStatsContainer(
                        text: "Volume",
                        value: "67.43M",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                      child: KeyStatsContainer(
                          text: "Avg Volume", value: "90.79M"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child:
                          KeyStatsContainer(text: "P/E Ratio", value: "28.1"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                      child: KeyStatsContainer(
                          text: "Dividend Yeild", value: "0.17%"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 16),
                      child: Text(
                        "Related  Companies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 33, 16),
                      child: Image.asset('assets/images/companyProfile.png'),
                    )
                  ],
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: halalStock?.hits?.length,
                      itemBuilder: (context, index) {
                        final obj = halalStock?.hits?[index];
                        return StockScreenerBucket(
                          companyName: obj?.document?.name.toString() ?? "",
                          companyTicker: obj?.document?.ticker.toString() ?? "",
                          currentPrice: obj?.document?.currentPrice ?? 0.0,
                          stockStatus:
                              obj?.document?.compliantRanking.toString() ?? "",
                          changePrice: obj?.document?.change ?? 0.0,
                          compliantRankings:
                              obj?.document?.compliantRanking ?? 0,
                          logoCompany: obj?.document?.logo.toString() ?? "",
                        );
                      }),
                ),

                // StockScreenerBucket(
                //     companyName: "Cityrise Financial",
                //     companyTicker: "CFG",
                //     currentPrice: 54.31,
                //     stockStatus: "Halal",
                //     changePrice: -23.34,
                //     compliantRankings: 1,
                //     logoCompany: "sm"),
                // StockScreenerBucket(
                //     companyName: "Cityrise Financial",
                //     companyTicker: "CFG",
                //     currentPrice: 54.31,
                //     stockStatus: "Halal",
                //     changePrice: -23.34,
                //     compliantRankings: 1,
                //     logoCompany: "sm"),
                // StockScreenerBucket(
                //     companyName: "Cityrise Financial",
                //     companyTicker: "CFG",
                //     currentPrice: 54.31,
                //     stockStatus: "Halal",
                //     changePrice: -23.34,
                //     compliantRankings: 1,
                //     logoCompany: "sm"),
                // StockScreenerBucket(
                //     companyName: "Cityrise Financial",
                //     companyTicker: "CFG",
                //     currentPrice: 54.31,
                //     stockStatus: "Halal",
                //     changePrice: -23.34,
                //     compliantRankings: 1,
                //     logoCompany: "sm"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> fetchStocks() async {
    //print("widget.selectedCountryCode");al
    //print(widget.selectedCountryCode);
    final response = await FeaturesApi.fetchRelatedHalalStocks(
        widget.tickerIsMainO, widget.countryCodeO, widget.finnHubIndustryO);
    print(response);

    setState(() {
      halalStock = response;
    });
  }
}
