import 'package:getxexample/src/model/country_entity.dart';

countryEntityFromJson(CountryEntity data, Map<String, dynamic> json) {
	if (json['countries'] != null) {
		data.countries = new List<CountryCountry>();
		(json['countries'] as List).forEach((v) {
			data.countries.add(new CountryCountry().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> countryEntityToJson(CountryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.countries != null) {
		data['countries'] =  entity.countries.map((v) => v.toJson()).toList();
	}
	return data;
}

countryCountryFromJson(CountryCountry data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['iso2'] != null) {
		data.iso2 = json['iso2']?.toString();
	}
	if (json['iso3'] != null) {
		data.iso3 = json['iso3']?.toString();
	}
	return data;
}

Map<String, dynamic> countryCountryToJson(CountryCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['iso2'] = entity.iso2;
	data['iso3'] = entity.iso3;
	return data;
}