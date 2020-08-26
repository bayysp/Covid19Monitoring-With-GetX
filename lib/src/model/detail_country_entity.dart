import 'package:getxexample/generated/json/base/json_convert_content.dart';

class DetailCountryEntity with JsonConvert<DetailCountryEntity> {
	DetailCountryConfirmed confirmed;
	DetailCountryRecovered recovered;
	DetailCountryDeaths deaths;
	String lastUpdate;
}

class DetailCountryConfirmed with JsonConvert<DetailCountryConfirmed> {
	int value;
	String detail;
}

class DetailCountryRecovered with JsonConvert<DetailCountryRecovered> {
	int value;
	String detail;
}

class DetailCountryDeaths with JsonConvert<DetailCountryDeaths> {
	int value;
	String detail;
}
