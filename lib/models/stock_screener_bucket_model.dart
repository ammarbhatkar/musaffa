// To parse this JSON data, do
//
//     final stockScreenerBucketModel = stockScreenerBucketModelFromJson(jsonString);

import 'dart:convert';

StockScreenerBucketModel stockScreenerBucketModelFromJson(String str) =>
    StockScreenerBucketModel.fromJson(json.decode(str));

String stockScreenerBucketModelToJson(StockScreenerBucketModel data) =>
    json.encode(data.toJson());

class StockScreenerBucketModel {
  List<dynamic>? facetCounts;
  int? found;
  List<Hit>? hits;
  int? outOf;
  int? page;
  RequestParams? requestParams;
  bool? searchCutoff;
  int? searchTimeMs;

  StockScreenerBucketModel({
    this.facetCounts,
    this.found,
    this.hits,
    this.outOf,
    this.page,
    this.requestParams,
    this.searchCutoff,
    this.searchTimeMs,
  });

  factory StockScreenerBucketModel.fromJson(Map<String, dynamic> json) =>
      StockScreenerBucketModel(
        facetCounts: json["facet_counts"] == null
            ? []
            : List<dynamic>.from(json["facet_counts"].map((x) => x)),
        found: json["found"],
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        outOf: json["out_of"],
        page: json["page"],
        requestParams: json["request_params"] == null
            ? null
            : RequestParams.fromJson(json["request_params"]),
        searchCutoff: json["search_cutoff"],
        searchTimeMs: json["search_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "facet_counts": facetCounts == null
            ? []
            : List<dynamic>.from(facetCounts!.map((x) => x)),
        "found": found,
        "hits": hits == null
            ? []
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
        "out_of": outOf,
        "page": page,
        "request_params": requestParams?.toJson(),
        "search_cutoff": searchCutoff,
        "search_time_ms": searchTimeMs,
      };
}

class Hit {
  Document? document;
  List<dynamic>? highlights;
  int? textMatch;

  Hit({
    this.document,
    this.highlights,
    this.textMatch,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        document: json["document"] == null
            ? null
            : Document.fromJson(json["document"]),
        highlights: json["highlights"] == null
            ? []
            : List<dynamic>.from(json["highlights"].map((x) => x)),
        textMatch: json["text_match"],
      );

  Map<String, dynamic> toJson() => {
        "document": document?.toJson(),
        "highlights": highlights == null
            ? []
            : List<dynamic>.from(highlights!.map((x) => x)),
        "text_match": textMatch,
      };
}

class Document {
  String? address;
  double? change;
  String? city;
  int? compliantRanking;
  String? country;
  CountryName? countryName;
  int? createDateTime;
  Currency? currency;
  double? currentPrice;
  String? cusip;
  String? description;
  int? employeeTotal;
  Exchange? exchange;
  double? exchangeMarketCap;
  String? finnhubIndustry;
  String? ggroup;
  String? gind;
  String? gsector;
  String? gsubind;
  String? id;
  String? identifier;
  DateTime? ipo;
  String? isin;
  int? lastUpdateTime;
  String? logo;
  Country? mainCountry;
  CountryName? mainCountryName;
  Currency? mainCurrency;
  String? mainTicker;
  MarketCapClassification? marketCapClassification;
  double? marketCapitalization;
  String? musaffaIndustryName;
  String? musaffaSectorName;
  String? naics;
  String? naicsNationalIndustry;
  String? naicsSector;
  String? naicsSubsector;
  String? name;
  double? percentChange;
  String? phone;
  RecommendationWeightedAverage? recommendationWeightedAverage;
  String? sedol;
  double? shareOutstanding;
  String? shariahCompliantStatus;
  String? state;
  Status? status;
  String? ticker;
  bool? tickerIsMain;
  double? usdMarketCap;
  String? weburl;

  Document({
    this.address,
    this.change,
    this.city,
    this.compliantRanking,
    this.country,
    this.countryName,
    this.createDateTime,
    this.currency,
    this.currentPrice,
    this.cusip,
    this.description,
    this.employeeTotal,
    this.exchange,
    this.exchangeMarketCap,
    this.finnhubIndustry,
    this.ggroup,
    this.gind,
    this.gsector,
    this.gsubind,
    this.id,
    this.identifier,
    this.ipo,
    this.isin,
    this.lastUpdateTime,
    this.logo,
    this.mainCountry,
    this.mainCountryName,
    this.mainCurrency,
    this.mainTicker,
    this.marketCapClassification,
    this.marketCapitalization,
    this.musaffaIndustryName,
    this.musaffaSectorName,
    this.naics,
    this.naicsNationalIndustry,
    this.naicsSector,
    this.naicsSubsector,
    this.name,
    this.percentChange,
    this.phone,
    this.recommendationWeightedAverage,
    this.sedol,
    this.shareOutstanding,
    this.shariahCompliantStatus,
    this.state,
    this.status,
    this.ticker,
    this.tickerIsMain,
    this.usdMarketCap,
    this.weburl,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        address: json["address"],
        change: json["change"]?.toDouble(),
        city: json["city"],
        compliantRanking: json["compliantRanking"],
        country: json["country"],
        countryName: countryNameValues.map[json["countryName"]],
        createDateTime: json["createDateTime"],
        currency: currencyValues.map[json["currency"]],
        currentPrice: json["currentPrice"]?.toDouble()!,
        cusip: json["cusip"],
        description: json["description"],
        employeeTotal: json["employeeTotal"],
        exchange: exchangeValues.map[json["exchange"]],
        exchangeMarketCap: json["exchangeMarketCap"]?.toDouble(),
        finnhubIndustry: json["finnhubIndustry"],
        ggroup: json["ggroup"],
        gind: json["gind"],
        gsector: json["gsector"],
        gsubind: json["gsubind"],
        id: json["id"],
        identifier: json["identifier"],
        ipo: json["ipo"] == null ? null : DateTime.parse(json["ipo"]),
        isin: json["isin"],
        lastUpdateTime: json["lastUpdateTime"],
        logo: json["logo"],
        mainCountry: countryValues.map[json["mainCountry"]],
        mainCountryName: countryNameValues.map[json["mainCountryName"]],
        mainCurrency: currencyValues.map[json["mainCurrency"]],
        mainTicker: json["mainTicker"],
        marketCapClassification:
            marketCapClassificationValues.map[json["marketCapClassification"]],
        marketCapitalization: json["marketCapitalization"]?.toDouble(),
        musaffaIndustryName: json["musaffaIndustryName"],
        musaffaSectorName: json["musaffaSectorName"],
        naics: json["naics"],
        naicsNationalIndustry: json["naicsNationalIndustry"],
        naicsSector: json["naicsSector"],
        naicsSubsector: json["naicsSubsector"],
        name: json["name"],
        percentChange: json["percentChange"]?.toDouble(),
        phone: json["phone"],
        recommendationWeightedAverage: recommendationWeightedAverageValues
            .map[json["recommendationWeightedAverage"]],
        sedol: json["sedol"],
        shareOutstanding: json["shareOutstanding"]?.toDouble(),
        shariahCompliantStatus: json["shariahCompliantStatus"],
        state: json["state"],
        status: statusValues.map[json["status"]],
        ticker: json["ticker"],
        tickerIsMain: json["tickerIsMain"],
        usdMarketCap: json["usdMarketCap"]?.toDouble(),
        weburl: json["weburl"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "change": change,
        "city": city,
        "compliantRanking": compliantRanking,
        "country": country,
        "countryName": countryNameValues.reverse[countryName],
        "createDateTime": createDateTime,
        "currency": currencyValues.reverse[currency],
        "currentPrice": currentPrice!,
        "cusip": cusip,
        "description": description,
        "employeeTotal": employeeTotal,
        "exchange": exchangeValues.reverse[exchange],
        "exchangeMarketCap": exchangeMarketCap,
        "finnhubIndustry": finnhubIndustry,
        "ggroup": ggroup,
        "gind": gind,
        "gsector": gsector,
        "gsubind": gsubind,
        "id": id,
        "identifier": identifier,
        "ipo":
            "${ipo!.year.toString().padLeft(4, '0')}-${ipo!.month.toString().padLeft(2, '0')}-${ipo!.day.toString().padLeft(2, '0')}",
        "isin": isin,
        "lastUpdateTime": lastUpdateTime,
        "logo": logo,
        "mainCountry": countryValues.reverse[mainCountry],
        "mainCountryName": countryNameValues.reverse[mainCountryName],
        "mainCurrency": currencyValues.reverse[mainCurrency],
        "mainTicker": mainTicker,
        "marketCapClassification":
            marketCapClassificationValues.reverse[marketCapClassification],
        "marketCapitalization": marketCapitalization,
        "musaffaIndustryName": musaffaIndustryName,
        "musaffaSectorName": musaffaSectorName,
        "naics": naics,
        "naicsNationalIndustry": naicsNationalIndustry,
        "naicsSector": naicsSector,
        "naicsSubsector": naicsSubsector,
        "name": name,
        "percentChange": percentChange,
        "phone": phone,
        "recommendationWeightedAverage": recommendationWeightedAverageValues
            .reverse[recommendationWeightedAverage],
        "sedol": sedol,
        "shareOutstanding": shareOutstanding,
        "shariahCompliantStatus": shariahCompliantStatusValues,
        "state": state,
        "status": statusValues.reverse[status],
        "ticker": ticker,
        "tickerIsMain": tickerIsMain,
        "usdMarketCap": usdMarketCap,
        "weburl": weburl,
      };
}

enum Country { US }

final countryValues = EnumValues({"US": Country.US});

enum CountryName { UNITED_STATES }

final countryNameValues =
    EnumValues({"United States": CountryName.UNITED_STATES});

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

enum Exchange { NASDAQ, NYSE }

final exchangeValues =
    EnumValues({"NASDAQ": Exchange.NASDAQ, "NYSE": Exchange.NYSE});

enum MarketCapClassification { MEGA_CAP }

final marketCapClassificationValues =
    EnumValues({"MEGA_CAP": MarketCapClassification.MEGA_CAP});

enum RecommendationWeightedAverage { BUY, HOLD }

final recommendationWeightedAverageValues = EnumValues({
  "Buy": RecommendationWeightedAverage.BUY,
  "Hold": RecommendationWeightedAverage.HOLD
});

enum ShariahCompliantStatus { COMPLIANT, NON_COMPLIANT, QUESTIONABLE }

final shariahCompliantStatusValues = EnumValues({
  "COMPLIANT": ShariahCompliantStatus.COMPLIANT,
  "NON_COMPLIANT": ShariahCompliantStatus.NON_COMPLIANT,
  "QUESTIONABLE": ShariahCompliantStatus.QUESTIONABLE
});

enum Status { PUBLISH }

final statusValues = EnumValues({"PUBLISH": Status.PUBLISH});

class RequestParams {
  String? collectionName;
  int? perPage;
  String? q;

  RequestParams({
    this.collectionName,
    this.perPage,
    this.q,
  });

  factory RequestParams.fromJson(Map<String, dynamic> json) => RequestParams(
        collectionName: json["collection_name"],
        perPage: json["per_page"],
        q: json["q"],
      );

  Map<String, dynamic> toJson() => {
        "collection_name": collectionName,
        "per_page": perPage,
        "q": q,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
