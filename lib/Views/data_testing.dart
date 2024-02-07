// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:musaffa/api/fetching_data_from_remote_config.dart';

// import 'package:musaffa/models/stock_screener_bucket_model.dart';
// import 'package:musaffa/widgets/stock_screener_bucket_widget.dart';

// class DataTesting extends StatefulWidget {
//   DataTesting({super.key});

//   @override
//   State<DataTesting> createState() => _DataTestingState();
// }

// class _DataTestingState extends State<DataTesting> {
//   StockScreenerBucketModel? stockScreenerData;

//   @override
//   void initState() {
//     super.initState();
//     fetchStocks();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             child: ListView.builder(
//                 itemCount: stockScreenerData?.hits?.length,
//                 itemBuilder: (context, index) {
//                   final obj = stockScreenerData?.hits?[index];
//                   //   final imgUrl = obj?.document?.logo ?? "";
//                   final name = obj?.document?.countryName ?? "";
//                   final imgUrl = obj?.document?.logo ?? "";

//                   return Column(
//                     children: [
//                       Container(
//                         child: SvgPicture.network(imgUrl),
//                       ),

//                       Container(
//                         child: Text(name.toString()),
//                       ),

//                       // companyTicker: obj?.document?.ticker ?? "",
//                       // usdMarketCaps: obj?.document?.usdMarketCap.toString() ?? "",
//                       // stockStatus:
//                       //     obj?.document?.shariahCompliantStatus.toString() ?? "",
//                     ],
//                   );
//                 })));
//   }

//   Future<void> fetchStocks() async {
//     final response = await FeaturesApi.fetchStockScreenerBucket();
//     print(response);
//     setState(() {
//       stockScreenerData = response;
//       // Update the fetchingList with the fetched data
//     });
//   }
// }
