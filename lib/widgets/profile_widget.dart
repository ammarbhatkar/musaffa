import 'package:flutter/material.dart';
import 'package:musaffa/widgets/profile_row_widget.dart';
import 'package:readmore/readmore.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 24, 37, 0),
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 20, 37, 16),
            child: ReadMoreText(
              "Apple, Inc. engages in the design, manufacture, and sale of smartphones, personal computers, tablets, wearables and accessories, and other varieties of related services. The company is headquartered in Cupertino, California and currently employs 164,000 full-time employees. The Company’s products include iPhone, Mac, iPad, AirPods, Apple TV, Apple Watch, Beats products, HomePod, iPod touch and accessories. The firm operates various platforms, including the App Store, which allows customers to discover and download applications and digital content, such as books, music, video, games and podcasts. Apple offers digital content through subscription-based services, including Apple Arcade, Apple Music, Apple News+, Apple TV+ and Apple Fitness+. Apple also offers a range of other services, such as AppleCare, iCloud, Apple Card and Apple Pay. Apple sells its products and resells third-party products in a range of markets, including directly to consumers, small and mid-sized businesses, and education, enterprise and government customers through its retail and online stores and its direct sales force.",
              trimLength: 200,
              trimMode: TrimMode.Length,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 144, 0),
              ),
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 144, 0),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 11, 11, 11),
              ),
            ),
          ),
          ProfileRowWidget(
            keyText: "Sector:",
            valueText: "Consumer Electronics",
          ),
          ProfileRowWidget(
            keyText: "Industry:",
            valueText: "Consumer Electronics",
          ),
          ProfileRowWidget(
            keyText: "Emplioyees:",
            valueText: "521 236 000",
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 16, 37, 8),
            child: Text(
              "Contact Information",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 11, 11, 11),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 37),
            child: ProfileRowWidget(
              keyText: "Address: ",
              valueText:
                  "Tesla Road 78725, United States, Texas, Austin United States",
            ),
          ),
          ProfileRowWidget(
            keyText: "Phone:",
            valueText: "512 516 8177",
          ),
          ProfileRowWidget(
            keyText: "Website:",
            valueText: "apple.com",
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
