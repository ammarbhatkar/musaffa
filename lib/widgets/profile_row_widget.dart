import 'package:flutter/material.dart';
import 'dart:isolate';

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget({
    super.key,
    required this.keyText,
    required this.valueText,
  });
  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    bool isDigit(String text) {
      return text != null && text.isNotEmpty && int.tryParse(text[0]) != null;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 8, 0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                keyText,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 68, 68, 68)),
              ),
            ),
            Expanded(
              child: Text(
                valueText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: valueText.isNotEmpty && isDigit(valueText[0])
                      ? Colors.black
                      : Color.fromARGB(255, 1, 154, 72),
                ),
              ),
            ),
          ]),
    );
  }
}
