import 'package:flutter/material.dart';

class DetailsContainerFooterWidget extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String countryText;
  final String countryTime;
  final double iconSize;
  final String timeFormat;
  DetailsContainerFooterWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.countryText,
    required this.countryTime,
    required this.iconSize,
    required this.timeFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 4, 0, 4),
            child: Icon(icon,
                size: iconSize,
                color: Color.fromARGB(
                    255, 62, 62, 62) // You can customize the icon color here
                ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 0, 3),
            child: Text(
              countryTime,
              style: TextStyle(
                  // You can customize the text color here
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 62, 62, 62)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: Text(
              timeFormat,
              style: TextStyle(
                  // You can customize the text color here
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 62, 62, 62)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 11, 3),
            child: Text(
              countryText,
              style: TextStyle(
                  // You can customize the text color here
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 62, 62, 62)),
            ),
          ),
        ],
      ),
    );
  }
}
