// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:musaffa/models/etf_screener_model.dart';
import 'package:musaffa/models/market_news.dart';
import 'package:musaffa/models/musaffa_app_features.dart';
import 'package:musaffa/models/musaffa_countries_model.dart';
import 'package:musaffa/models/musffa_academy_model.dart';
import 'package:http/http.dart' as http;
import 'package:musaffa/models/stock_screener_bucket_model.dart';

class FeaturesApi {
  static Future<List<Features>> fetchFeaturesData() async {
    final results =
        jsonDecode(FirebaseRemoteConfig.instance.getString("app_features"))
            as List<dynamic>;
    final sliderSection = results.map((e) {
      return Features.fromJson(e);
    }).toList();
    return sliderSection;
  }

  static Future<List<Academy>> fetchMusffaAcademy() async {
    final results =
        jsonDecode(FirebaseRemoteConfig.instance.getString("musaffa_academy"))
            as List<dynamic>;
    final sliderSection = results.map((e) {
      return Academy.fromJson(e);
    }).toList();
    return sliderSection;
  }

  static Future<List<CountriesModel>> fetchFilterCountries() async {
    final results = jsonDecode(
            FirebaseRemoteConfig.instance.getString("app_feature_countries"))
        as List<dynamic>;
    final listSection = results.map((e) {
      return CountriesModel.fromJson(e);
    }).toList();
    return listSection;
  }

  static Future<MarketNewsModel> fetchMarketNews() async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/market_news_collection/documents/search?q=*&per_page=10';
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      return MarketNewsModel.fromJson(json);
    } else {
      throw Exception('Failed to load market news');
    }
  }

  static Future<StockScreenerBucketModel> fetchStockScreenerBucket(
      String countryCode) async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/company_profile_collection/documents/search?sort_by=usdMarketCap:desc,exchangeMarketCap:desc&page=1&per_page=15&q=*&filter_by=status:=PUBLISH%26%26tickerIsMain:=true%26%26country:=$countryCode?%26%26exchange:!=OTC';
    log(countryCode);
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      return StockScreenerBucketModel.fromJson(json);
    } else {
      throw Exception('Failed to load market news');
    }
  }

  static Future<EtfScreenerModel> fetchEtfScreener(String countryCode) async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/etf_profile_collection_alias/documents/search?sort_by=aum:desc&per_page=15&q=*&filter_by=domicile:=$countryCode';
    log("ETF COuntryCode");
    log(countryCode);
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      return EtfScreenerModel.fromJson(json);
    } else {
      throw Exception('Failed to load market news');
    }
  }

  static Future<StockScreenerBucketModel> fetchRelatedHalalStocks(
      String tickerIsMainO,
      String countryCodeO,
      String finnHubIndustryO) async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/company_profile_collection/documents/search?sort_by=usdMarketCap:desc,exchangeMarketCap:desc&page=1&per_page=15&q=*&filter_by=tickerIsMain:=$tickerIsMainO%26%26country:=$countryCodeO%26%26gsector:=Information Technology%26%26finnhubIndustry:=$finnHubIndustryO%26%26exchange:!=OTC%26%26ticker:!=ADBE%26%26shariahCompliantStatus:=COMPLIANT%26%26status:=PUBLISH';
    // log(countryCode);
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      return StockScreenerBucketModel.fromJson(json);
    } else {
      throw Exception('Failed to load market news');
    }
  }
}
