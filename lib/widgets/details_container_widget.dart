// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musaffa/widgets/details_container_chips_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget.dart';
import 'package:musaffa/widgets/details_container_footer_widget_s.dart';

class ContainerDetailWidget extends StatefulWidget {
  const ContainerDetailWidget({super.key});

  @override
  State<ContainerDetailWidget> createState() => _ContainerDetailWidgetState();
}

class _ContainerDetailWidgetState extends State<ContainerDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              color: Color.fromARGB(255, 227, 227, 227), // Set the border color
              width: 1.0, // Set the border width
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                              color: Colors.black,
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
                                  color: Colors.black,
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
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                    child: Text("(",
                                        style: GoogleFonts.redHatDisplay(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 174, 175, 174))),
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
                                          color: Color.fromARGB(
                                              255, 174, 175, 174))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
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
              ),
              Padding(
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
              ),
              ClipRRect(
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
                                          color:
                                              Color.fromARGB(255, 27, 173, 78),
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
              ) //containerHeader
            ],
          ),
        ),
      )
    ]);
  }
}
