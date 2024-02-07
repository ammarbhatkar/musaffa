import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ExploreMusaffa extends StatelessWidget {
  ExploreMusaffa({super.key, required this.imagePath, required this.title});
  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 05, 0, 30),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.7,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.7, -0.3), // Center position (17%, 58.93%)
            focal: Alignment(-0.7, 0.0), // Focal position (17%, 58.93%)
            radius: 1.3894, // Radius (138.94%)
            colors: [
              Color.fromRGBO(27, 173, 78, 0.65),
              Color(0xFF1BAD4E),
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                child: SvgPicture.asset(
                  imagePath,
                  width: 27,
                  height: 27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Container(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
