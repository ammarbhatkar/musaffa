import 'package:flutter/material.dart';

class DetailsFooterWidget extends StatelessWidget {
  final Color backgroundColor;
  IconData? icon;
  final String text;
  double? iconSize;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;

  //

  double? leftPaddingIcon;
  double? rightPaddingIcon;
  double? topPaddingIcon;
  double? bottomPaddingIcon;
  // Add this property

  DetailsFooterWidget({
    Key? key,
    required this.backgroundColor,
    this.icon,
    required this.text,
    this.iconSize,
    required this.leftPadding,
    required this.rightPadding,
    required this.topPadding,
    required this.bottomPadding,
    this.leftPaddingIcon,
    this.rightPaddingIcon,
    this.topPaddingIcon,
    this.bottomPaddingIcon, // Set a default icon size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor,
            ),
            child: Row(
              children: [
                //Set the height to control the icon size
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    leftPaddingIcon ?? 0.0,
                    topPaddingIcon ?? 0.0,
                    rightPaddingIcon ?? 0.0,
                    bottomPaddingIcon ?? 0.0,
                  ),
                  child: Icon(
                    icon,
                    size: iconSize, // Set the icon size
                    color: Colors.black,
                    // You can customize the icon color here
                  ),
                ),
                // Add some spacing between icon and text
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    leftPadding,
                    topPadding,
                    rightPadding,
                    bottomPadding,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400, // Customize the text size
                      color:
                          Colors.black, // You can customize the text color here
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
