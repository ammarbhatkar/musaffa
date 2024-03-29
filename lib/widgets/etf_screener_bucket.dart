import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class EtfScreenerBucket extends StatefulWidget {
  const EtfScreenerBucket({
    super.key,
    required this.stockStatus,
    required this.companyName,
    required this.mainSymbol,
    required this.currentPrice,
    required this.changePrice,
  });

  final String stockStatus;
  final String companyName;
  final String mainSymbol;
  final double currentPrice;
  final double changePrice;
  @override
  State<EtfScreenerBucket> createState() => _EtfScreenerBucketState();
}

class _EtfScreenerBucketState extends State<EtfScreenerBucket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 204, 202, 202))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 10, 0, 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                          child: Text(
                            widget.companyName,
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 14, fontWeight: FontWeight.w600),
                            // style: TextStyle(
                            //     fontSize: 14, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 14),
                      child: Text(
                        widget.mainSymbol,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 157, 157, 157),
                        ), // Display the full ticker if it's 6 characters or shorter
                        // style: TextStyle(
                        //   fontSize: 12,
                        //   fontWeight: FontWeight.w400,
                        //   color: Color.fromARGB(255, 157, 157, 157),
                        //),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 14),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                    color: widget.stockStatus == 'NON_COMPLIANT'
                        ? Color.fromARGB(
                            255, 253, 230, 230) // Red color for non-compliant
                        : widget.stockStatus == 'QUESTIONABLE'
                            ? Color.fromARGB(255, 255, 241, 223)
                            // Yellow color for questionable
                            : Color.fromARGB(
                                255, 225, 247, 233), // Green for compliant
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0, // Left padding
                          widget.stockStatus == 'COMPLIANT'
                              ? 5
                              : 10, // Top padding (10 for "Halal", 14 for others)
                          0, // Right padding

                          widget.stockStatus == 'COMPLIANT'
                              ? 0
                              : 6, // Bottom padding
                        ),
                        child: Center(
                          child: Text(
                            widget.stockStatus == 'NON_COMPLIANT'
                                ? "Not Halal"
                                : widget.stockStatus == 'QUESTIONABLE'
                                    ? "Doubtful" // Display "Doubtful" for questionable
                                    : "Halal",
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: widget.stockStatus == 'NON_COMPLIANT'
                                    ? Color.fromARGB(255, 199, 7, 7)
                                    // White text color for non-compliant
                                    : widget.stockStatus == 'QUESTIONABLE'
                                        ? Color.fromARGB(255, 255, 128,
                                            0) // White text color for questionable
                                        : Color.fromARGB(255, 57, 169, 57)
                                // Green text color for compliant
                                ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 11, 6),
                          child: Container(
                            child: widget.stockStatus == 'COMPLIANT'
                                ? SmoothStarRating(
                                    spacing: 2,
                                    starCount: 5,
                                    size: 10,
                                    borderColor:
                                        Color.fromARGB(255, 57, 169, 57),
                                    //  rating: widget.compliantRankings.toDouble(),
                                    color: Color.fromARGB(255, 57, 169, 57),
                                  )
                                : null, // Omit stars for "not under coverage" or "questionable"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 16, 0),
                      child: Text(
                        widget.currentPrice != 0.0
                            ? widget.changePrice.toString()
                            : "-",
                        style: GoogleFonts.redHatDisplay(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 2, 16, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.changePrice.toString().startsWith('-')
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 10,
                                    color: Color.fromARGB(255, 199, 7,
                                        7), // Red color for negative values
                                  ),
                                )
                              : SizedBox(), // Empty SizedBox if the value is not negative
                          Text(
                            widget.changePrice != 0.0
                                ? widget.changePrice.toString()
                                : "-",
                            style: GoogleFonts.redHatDisplay(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: widget.changePrice
                                      .toString()
                                      .startsWith('-')
                                  ? Color.fromARGB(255, 199, 7,
                                      7) // Red color for negative values
                                  : Color.fromARGB(255, 27, 173,
                                      78), // Green color for positive values
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
