import 'package:flutter/material.dart';

class InvestmentContainerWidget extends StatelessWidget {
  const InvestmentContainerWidget({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.iconContainerColor,
    required this.title,
    required this.subTitle,
    required this.iconColor,
  });
  final IconData icon;
  final double iconSize;
  final Color iconContainerColor;
  final String title;
  final String subTitle;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: iconContainerColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 11, 9.53, 11),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
