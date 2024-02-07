class CountriesModel {
  String? country;
  String? code;

  CountriesModel({this.country, this.code});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['code'] = this.code;
    return data;
  }
}
