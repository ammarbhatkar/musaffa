import 'package:flutter/material.dart';

class KeyStatsContainer extends StatelessWidget {
  const KeyStatsContainer({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color.fromARGB(255, 197, 193, 193))
          // border: Border(
          //   bottom: BorderSide(
          //     color: Color.fromARGB(255, 191, 228, 204),
          //     width: 2,
          //   ),
          ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
