import 'package:getxexample/generated/json/base/json_convert_content.dart';

class CountryEntity with JsonConvert<CountryEntity> {
	List<CountryCountry> countries;
}

class CountryCountry with JsonConvert<CountryCountry> {
	String name;
	String iso2;
	String iso3;
}
