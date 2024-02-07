// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:musaffa/widgets/news_tab_list_widget.dart';

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with TickerProviderStateMixin {
  late TabController newsTabController;

  @override
  void initState() {
    newsTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 16, 19, 0),
      child: Container(
        height: 570,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 227, 227, 227),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 23, 0, 0),
                  child: Text(
                    "News",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 21.77, 15, 0),
                  child: Image.asset('assets/images/newspaper.png'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TabBar(
                padding: EdgeInsets.zero,
                controller: newsTabController,
                unselectedLabelColor: Color.fromARGB(255, 124, 124, 124),
                labelColor: Color.fromARGB(255, 27, 173, 78),
                indicatorColor: Color.fromARGB(255, 27, 173, 78),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Text(
                      "Latest News",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Text(
                      "Press Release",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: newsTabController,
                children: [
                  Container(
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      SizedBox(
                        height: 12,
                      ),
                    ]),
                  ),
                  // Add your content for "Latest News" here
                  // Add your content for "Press Release" here
                  Container(
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                      Divider(),
                      NewTabListWidget(),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
