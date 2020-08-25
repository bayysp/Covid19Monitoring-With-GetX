import 'package:getxexample/generated/json/base/json_convert_content.dart';

class GlobalEntity with JsonConvert<GlobalEntity> {
  GlobalConfirmed confirmed;
  GlobalRecovered recovered;
  GlobalDeaths deaths;
  String dailySummary;
  GlobalDailyTimeSeries dailyTimeSeries;
  String image;
  String source;
  String countries;
  GlobalCountryDetail countryDetail;
  String lastUpdate;
}

class GlobalConfirmed with JsonConvert<GlobalConfirmed> {
  int value;
  String detail;
}

class GlobalRecovered with JsonConvert<GlobalRecovered> {
  int value;
  String detail;
}

class GlobalDeaths with JsonConvert<GlobalDeaths> {
  int value;
  String detail;
}

class GlobalDailyTimeSeries with JsonConvert<GlobalDailyTimeSeries> {
  String pattern;
  String example;
}

class GlobalCountryDetail with JsonConvert<GlobalCountryDetail> {
  String pattern;
  String example;
}
