// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:musaffa/models/market_news.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MarketNewsWidget extends StatefulWidget {
  const MarketNewsWidget({super.key});

  @override
  State<MarketNewsWidget> createState() => _MarketNewsWidgetState();
}

class _MarketNewsWidgetState extends State<MarketNewsWidget> {
  Future<MarketNewsModel> getProductsApi() async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/market_news_collection/documents/search?q=*&per_page=10';
    final uri = await Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return MarketNewsModel.fromJson(data);
    } else {
      return MarketNewsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<MarketNewsModel>(
          future: getProductsApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data!.hits!.length,
                itemBuilder: (context, index) {
                  final varList = snapshot.data!.hits![index];
                  final source =
                      snapshot.data!.hits![index].document!.source.toString();

                  final headline =
                      snapshot.data!.hits![index].document!.headline;
                  final timestamp =
                      snapshot.data!.hits![index].document!.datetime;

                  DateTime dateTime =
                      DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);

                  // Format the DateTime object with both date and time
                  String formattedDate =
                      DateFormat('MMM d, HH:mm a').format(dateTime);
                  final urlMarket = snapshot.data!.hits![index].document!.url;
                  return GestureDetector(
                    onTap: () {
                      launchUrlString(urlMarket.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                              color: Color.fromRGBO(135, 134, 134, 0.612),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          source,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 3, 0, 0),
                                          child: Text(
                                            formattedDate,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 133, 133, 133),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        headline.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 25, 8, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    snapshot.data!.hits![index].document!.image
                                        .toString(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
