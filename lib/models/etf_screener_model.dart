// To parse this JSON data, do
//
//     final etfScreenerModel = etfScreenerModelFromJson(jsonString);

import 'dart:convert';

EtfScreenerModel etfScreenerModelFromJson(String str) =>
    EtfScreenerModel.fromJson(json.decode(str));

String etfScreenerModelToJson(EtfScreenerModel data) =>
    json.encode(data.toJson());

class EtfScreenerModel {
  List<dynamic>? facetCounts;
  int? found;
  List<Hit>? hits;
  int? outOf;
  int? page;
  RequestParams? requestParams;
  bool? searchCutoff;
  int? searchTimeMs;

  EtfScreenerModel({
    this.facetCounts,
    this.found,
    this.hits,
    this.outOf,
    this.page,
    this.requestParams,
    this.searchCutoff,
    this.searchTimeMs,
  });

  factory EtfScreenerModel.fromJson(Map<String, dynamic> json) =>
      EtfScreenerModel(
        facetCounts: json["facet_counts"] == null
            ? []
            : List<dynamic>.from(json["facet_counts"]!.map((x) => x)),
        found: json["found"],
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
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
            : List<dynamic>.from(json["highlights"]!.map((x) => x)),
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
  AssetClass? assetClass;
  int? aum;
  double? avgVolume;
  double? change;
  int? createDateTime;
  double? currentPrice;
  String? cusip;
  String? description;
  Domicile? domicile;
  String? etfCompany;
  Exchange? exchange;
  double? expenseRatio;
  String? id;
  String? identifier;
  DateTime? inceptionDate;
  String? investmentSegment;
  String? isin;
  int? lastUpdateTime;
  String? mainSymbol;
  String? name;
  double? nav;
  NavCurrency? navCurrency;
  int? numberOfHoldings;
  double? percentChange;
  double? priceToBook;
  double? priceToEarnings;
  int? ranking;
  String? shariahStates;
  String? symbol;
  String? trackingIndex;
  String? website;

  Document({
    this.assetClass,
    this.aum,
    this.avgVolume,
    this.change,
    this.createDateTime,
    this.currentPrice,
    this.cusip,
    this.description,
    this.domicile,
    this.etfCompany,
    this.exchange,
    this.expenseRatio,
    this.id,
    this.identifier,
    this.inceptionDate,
    this.investmentSegment,
    this.isin,
    this.lastUpdateTime,
    this.mainSymbol,
    this.name,
    this.nav,
    this.navCurrency,
    this.numberOfHoldings,
    this.percentChange,
    this.priceToBook,
    this.priceToEarnings,
    this.ranking,
    this.shariahStates,
    this.symbol,
    this.trackingIndex,
    this.website,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        assetClass: assetClassValues.map[json["assetClass"]],
        aum: json["aum"],
        avgVolume: json["avgVolume"]?.toDouble(),
        change: json["change"]?.toDouble(),
        createDateTime: json["createDateTime"],
        currentPrice: json["currentPrice"]?.toDouble(),
        cusip: json["cusip"],
        description: json["description"],
        domicile: domicileValues.map[json["domicile"]],
        etfCompany: json["etfCompany"],
        exchange: exchangeValues.map[json["exchange"]],
        expenseRatio: json["expenseRatio"]?.toDouble(),
        id: json["id"],
        identifier: json["identifier"],
        inceptionDate: json["inceptionDate"] == null
            ? null
            : DateTime.parse(json["inceptionDate"]),
        investmentSegment: json["investmentSegment"],
        isin: json["isin"],
        lastUpdateTime: json["lastUpdateTime"],
        mainSymbol: json["mainSymbol"],
        name: json["name"],
        nav: json["nav"]?.toDouble(),
        navCurrency: navCurrencyValues.map[json["navCurrency"]],
        numberOfHoldings: json["numberOfHoldings"],
        percentChange: json["percentChange"]?.toDouble(),
        priceToBook: json["priceToBook"]?.toDouble(),
        priceToEarnings: json["priceToEarnings"]?.toDouble(),
        ranking: json["ranking"],
        shariahStates: json["shariahStates"],
        symbol: json["symbol"],
        trackingIndex: json["trackingIndex"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "assetClass": assetClassValues.reverse[assetClass],
        "aum": aum,
        "avgVolume": avgVolume,
        "change": change,
        "createDateTime": createDateTime,
        "currentPrice": currentPrice,
        "cusip": cusip,
        "description": description,
        "domicile": domicileValues.reverse[domicile],
        "etfCompany": etfCompany,
        "exchange": exchangeValues.reverse[exchange],
        "expenseRatio": expenseRatio,
        "id": id,
        "identifier": identifier,
        "inceptionDate":
            "${inceptionDate!.year.toString().padLeft(4, '0')}-${inceptionDate!.month.toString().padLeft(2, '0')}-${inceptionDate!.day.toString().padLeft(2, '0')}",
        "investmentSegment": investmentSegment,
        "isin": isin,
        "lastUpdateTime": lastUpdateTime,
        "mainSymbol": mainSymbol,
        "name": name,
        "nav": nav,
        "navCurrency": navCurrencyValues.reverse[navCurrency],
        "numberOfHoldings": numberOfHoldings,
        "percentChange": percentChange,
        "priceToBook": priceToBook,
        "priceToEarnings": priceToEarnings,
        "ranking": ranking,
        "shariahStates": shariahStatesValues,
        "symbol": symbol,
        "trackingIndex": trackingIndex,
        "website": website,
      };
}

enum AssetClass { EQUITY, FIXED_INCOME }

final assetClassValues = EnumValues(
    {"Equity": AssetClass.EQUITY, "Fixed Income": AssetClass.FIXED_INCOME});

enum Domicile { US }

final domicileValues = EnumValues({"US": Domicile.US});

enum Exchange { BATS, NASDAQ, NYSE_ARCA }

final exchangeValues = EnumValues({
  "BATS": Exchange.BATS,
  "NASDAQ": Exchange.NASDAQ,
  "NYSE ARCA": Exchange.NYSE_ARCA
});

enum NavCurrency { USD }

final navCurrencyValues = EnumValues({"USD": NavCurrency.USD});

enum ShariahStates { NON_COMPLIANT }

final shariahStatesValues =
    EnumValues({"NON_COMPLIANT": ShariahStates.NON_COMPLIANT});

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
