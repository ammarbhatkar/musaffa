import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsContainerChipWidget extends StatelessWidget {
  const DetailsContainerChipWidget({
    super.key,
    required this.chipText,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
  });
  final String chipText;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green, // Set the border color to green
        ),
        borderRadius:
            BorderRadius.circular(100), // Set the border radius to 100
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          leftPadding,
          topPadding,
          rightPadding,
          bottomPadding,
        ),
        child: Text(
          chipText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
