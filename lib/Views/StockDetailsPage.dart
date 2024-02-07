// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musaffa/widgets/details_container_chips_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget_s.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class StockDetailsPage extends StatefulWidget {
  const StockDetailsPage({super.key});

  @override
  State<StockDetailsPage> createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends State<StockDetailsPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              _header(),
              _detailsContainer(),
            ]),
            SingleChildScrollView(child: _companyProfileContainer()),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 251, 249, 242),
      ),
      child: Container(
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 22.22, 0, 22.22),
            child: Icon(
              Icons.arrow_back,
              size: 24,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 21, 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Icon(
                  Icons.star_border_rounded,
                  color: Color.fromARGB(255, 27, 173, 78),
                  size: 18,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _detailsContainer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  //  bottomRight: Radius.circular(10),
                  //bottomLeft: Radius.circular(10),
                ),
                border: Border.all(
                  color: Color.fromARGB(
                      255, 227, 227, 227), // Set the border color
                  width: 1.0, // Set the border width
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailsContainerHeader(),
                  _detailsContainerChips(),
                  _detailsContainerFooter(),
                  SizedBox(height: 24),
                  _detailsDottedBorderContainer(),
                  SizedBox(height: 14),
                  // _graphContainer(),
                  //SizedBox(height: 10),
                  //SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsContainerHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 27, 0, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 12, 12, 13),
              child: Icon(Icons.apple_outlined),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Apple Inc.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                    child: Text(
                      "427",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 9, 0, 0),
                    child: Icon(
                      Icons.arrow_drop_up_sharp,
                      size: 20,
                      color: Color.fromARGB(255, 27, 173, 78),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 11, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "50.67",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                          child: Text("(",
                              style: GoogleFonts.redHatDisplay(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 174, 175, 174))),
                        ),
                        Text(
                          "+10.67%",
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 27, 173, 78),
                          ),
                        ),
                        Text(")",
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 174, 175, 174))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _detailsContainerChips() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 30, 0, 0),
      child: Wrap(
        spacing: 06, // Space between the chips
        runSpacing: 10, // Vertical spacing between lines of chips
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
            child: DetailsContainerChipWidget(
              chipText: "United States",
              leftPadding: 32,
              rightPadding: 18,
              topPadding: 7,
              bottomPadding: 7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
            child: DetailsContainerChipWidget(
              chipText: "Technology",
              leftPadding: 16,
              rightPadding: 18,
              topPadding: 7,
              bottomPadding: 7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 95, 0),
            child: DetailsContainerChipWidget(
              chipText: "Mega Cap",
              leftPadding: 15,
              rightPadding: 19,
              topPadding: 7,
              bottomPadding: 7,
            ),
          ),
          // Add more chips as needed
        ],
      ),
    );
  }

  Widget _detailsContainerFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 14, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              DetailsContainerFooterWidget(
                backgroundColor: Color.fromARGB(255, 249, 245, 237),
                icon: Icons.access_time,
                iconSize: 12,
                countryTime: "15:21:45",
                countryText: "Delayed",
                timeFormat: "UTC-4",
              ),
              SizedBox(width: 8),
              DetailsFooterWidget(
                backgroundColor: Color.fromARGB(255, 230, 250, 243),
                icon: Icons.trending_up_outlined,
                text: "NASDAQ",
                iconSize: 16,
                leftPadding: 3,
                rightPadding: 12,
                topPadding: 3,
                bottomPadding: 3,
                leftPaddingIcon: 7,
                topPaddingIcon: 1,
                bottomPaddingIcon: 3,
                rightPaddingIcon: 0,
              ),
            ],
          ),
          SizedBox(height: 8),
          DetailsFooterWidget(
            backgroundColor: Color.fromARGB(255, 233, 250, 233),
            icon: Icons.attach_money_sharp,
            iconSize: 14,
            text: "USD",
            leftPadding: 0,
            rightPadding: 12,
            topPadding: 3,
            bottomPadding: 3,
            leftPaddingIcon: 3,
            topPaddingIcon: 3,
            bottomPaddingIcon: 3,
          )
        ],
      ),
    );
  }

  Widget _detailsDottedBorderContainer() {
    return ClipRRect(
      // borderRadius: BorderRadius.only(
      //   bottomRight: Radius.circular(10),
      //   bottomLeft: Radius.circular(10),
      //),
      child: DottedBorder(
        borderType: BorderType.Rect,
        color: Color.fromARGB(255, 216, 216, 216),
        radius: Radius.circular(25),
        strokeWidth: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 0, 5),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Low",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 112, 111, 111),
                        ),
                      ),
                      Text(
                        "521.56 USD",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 84, 84, 84),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "High",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 112, 111, 111),
                      ),
                    ),
                    Text(
                      "521.56 USD",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 84, 84, 84),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "Return ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 112, 111, 111),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_drop_up_sharp,
                              size: 20,
                              color: Color.fromARGB(255, 27, 173, 78),
                            ),
                            Text(
                              "52.00%",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 27, 173, 78),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyProfileContainer() {
    double redContainerHeight = MediaQuery.of(context).size.height - 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 249, 242),
              ),
              child: _tabBarContainer()),
          Container(
            color: Color.fromARGB(255, 251, 249, 242),
            height: redContainerHeight,
            child: Flexible(child: _tabViewContainer()),
          ),
        ],
      ),
    );
  }

  Widget _tabBarContainer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 26, 0, 15),
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
                  "Earnings",
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
    );
  }

  Widget _tabViewContainer() {
    return TabBarView(
      controller: tabController,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _graphContainer(),
              _overViewWidget(),
              _investmentCheckListWidget(),
            ],
          ),
        ),
        Text("Hello"),
        Text("Hello"),
        Text("Hello"),
      ],
    );
  }

  Widget _graphContainer() {
    return Container(
      color: Colors.white,
      height: 290,
    );
  }

  Widget _overViewWidget() {
    return Padding(
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
                        padding: const EdgeInsets.fromLTRB(40, 0.62, 40, 16.49),
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
    );
  }

  Widget _investmentCheckListWidget() {
    return Expanded(
      child: Container(
        child: Column(children: [
          Text("Investment Checklist"),
          Row(
            children: [
              Icon(Icons.arrow_drop_up_sharp),
              Text("54 % Expected Annual Return")
            ],
          ),
          Text(
              "Based on 1 year median target stock price of \$645 and annual dividend yeild of 2% "),
          Divider(),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.error),
                  Text("54 % Expected Annual Return"),
                  Text(
                      "Based on 1 year median target stock price of \$645 and annual dividend yeild of 2% "),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
