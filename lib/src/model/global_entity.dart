class GlobalEntity {
  Confirmed? confirmed;
  Confirmed? recovered;
  Confirmed? deaths;
  String? dailySummary;
  DailyTimeSeries? dailyTimeSeries;
  String? image;
  String? source;
  String? countries;
  DailyTimeSeries? countryDetail;
  String? lastUpdate;

  GlobalEntity(
      {this.confirmed,
        this.recovered,
        this.deaths,
        this.dailySummary,
        this.dailyTimeSeries,
        this.image,
        this.source,
        this.countries,
        this.countryDetail,
        this.lastUpdate});

  GlobalEntity.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'] != null
        ? new Confirmed.fromJson(json['confirmed'])
        : null;
    recovered = json['recovered'] != null
        ? new Confirmed.fromJson(json['recovered'])
        : null;
    deaths =
    json['deaths'] != null ? new Confirmed.fromJson(json['deaths']) : null;
    dailySummary = json['dailySummary'];
    dailyTimeSeries = json['dailyTimeSeries'] != null
        ? new DailyTimeSeries.fromJson(json['dailyTimeSeries'])
        : null;
    image = json['image'];
    source = json['source'];
    countries = json['countries'];
    countryDetail = json['countryDetail'] != null
        ? new DailyTimeSeries.fromJson(json['countryDetail'])
        : null;
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.confirmed != null) {
      data['confirmed'] = this.confirmed!.toJson();
    }
    if (this.recovered != null) {
      data['recovered'] = this.recovered!.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths!.toJson();
    }
    data['dailySummary'] = this.dailySummary;
    if (this.dailyTimeSeries != null) {
      data['dailyTimeSeries'] = this.dailyTimeSeries!.toJson();
    }
    data['image'] = this.image;
    data['source'] = this.source;
    data['countries'] = this.countries;
    if (this.countryDetail != null) {
      data['countryDetail'] = this.countryDetail!.toJson();
    }
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}

class Confirmed {
  int? value;
  String? detail;

  Confirmed({this.value, this.detail});

  Confirmed.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['detail'] = this.detail;
    return data;
  }
}

class DailyTimeSeries {
  String? pattern;
  String? example;

  DailyTimeSeries({this.pattern, this.example});

  DailyTimeSeries.fromJson(Map<String, dynamic> json) {
    pattern = json['pattern'];
    example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pattern'] = this.pattern;
    data['example'] = this.example;
    return data;
  }
}
