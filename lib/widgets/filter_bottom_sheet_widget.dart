// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musaffa/Views/stock_screener.dart';

import '../models/musaffa_countries_model.dart';
import '../models/musffa_academy_model.dart';
import '../api/fetching_data_from_remote_config.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String selectedCountry = "India";

  List<CountriesModel> fetchCountriesList = [];
  List<CountriesModel> filteredCountriesList = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  void initState() {
    super.initState();
    fetchCountries();
    filteredCountriesList = fetchCountriesList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 2,
          indent: 100,
          endIndent: 100,
          color: Color.fromARGB(255, 226, 225, 225),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2, color: Color.fromARGB(255, 226, 225, 225)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
                  child: Icon(Icons.search,
                      size: 18, color: Color.fromARGB(255, 133, 125, 125)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (String? value) {
                        print(value);
                        setState(() {
                          search = value.toString();
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Search for a market",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 133, 125, 125),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            child: Text(
              "Covered Markets",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 109, 107, 107)),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Stack(children: [
              if (search.isNotEmpty && filteredCountriesList.isEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' "Invalid  Country" ',
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 201, 199, 199),
                    ),
                  ),
                )
              else
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: ListView.builder(
                    itemCount: fetchCountriesList.length,
                    itemBuilder: (context, index) {
                      final obj = fetchCountriesList[index];
                      final country = obj.country;
                      final countryCode = obj.code.toString();

                      if (search.isEmpty ||
                          country!.toLowerCase().contains(search.toLowerCase()))
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              {
                                'country': country.toString(),
                                'SelectedCountryCode': countryCode,
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 124, 123, 123),
                                  width: 0.1,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 15, 0, 15),
                              child: Text(
                                country.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                    },
                  ),
                ),
            ]),
          ),
        ),
      ]),
    );
  }

  Future<void> fetchCountries() async {
    final response = await FeaturesApi.fetchFilterCountries();

    setState(() {
      fetchCountriesList = response;

      // Update the fetchingList with the fetched data
    });
  }
}
