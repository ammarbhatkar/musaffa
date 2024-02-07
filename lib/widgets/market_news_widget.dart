import 'package:flutter/material.dart';
import 'package:musaffa/models/market_news.dart';

class MarketNewsWidget extends StatelessWidget {
  const MarketNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MarketNewsModel? newsData;
    return Column(
      children: [
        ListView.builder(
            itemCount: newsData?.hits?.length, itemBuilder: (context, index) {})
      ],
    );
  }
}
