// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTabListWidget extends StatelessWidget {
  const NewTabListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 15, 8, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.58,

                  //width: 220,
                  child: Text(
                    "RBI wants digital currency included under definition of 'bank note': FinMin",
                    style: TextStyle(
                      fontSize: 13.7,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 0, 0),
                child: Text(
                  "01 August 2022  |  17:00 PM",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 126, 126, 126),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 2, 0),
            child: Image.asset(
              'assets/images/rbi.png',
              height: 54,
              width: 50,
            ),
          )
        ]);
  }
}
