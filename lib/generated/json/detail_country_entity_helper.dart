import 'package:getxexample/src/model/detail_country_entity.dart';

detailCountryEntityFromJson(DetailCountryEntity data, Map<String, dynamic> json) {
	if (json['confirmed'] != null) {
		data.confirmed = new DetailCountryConfirmed().fromJson(json['confirmed']);
	}
	if (json['recovered'] != null) {
		data.recovered = new DetailCountryRecovered().fromJson(json['recovered']);
	}
	if (json['deaths'] != null) {
		data.deaths = new DetailCountryDeaths().fromJson(json['deaths']);
	}
	if (json['lastUpdate'] != null) {
		data.lastUpdate = json['lastUpdate']?.toString();
	}
	return data;
}

Map<String, dynamic> detailCountryEntityToJson(DetailCountryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.confirmed != null) {
		data['confirmed'] = entity.confirmed.toJson();
	}
	if (entity.recovered != null) {
		data['recovered'] = entity.recovered.toJson();
	}
	if (entity.deaths != null) {
		data['deaths'] = entity.deaths.toJson();
	}
	data['lastUpdate'] = entity.lastUpdate;
	return data;
}

detailCountryConfirmedFromJson(DetailCountryConfirmed data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> detailCountryConfirmedToJson(DetailCountryConfirmed entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}

detailCountryRecoveredFromJson(DetailCountryRecovered data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> detailCountryRecoveredToJson(DetailCountryRecovered entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}

detailCountryDeathsFromJson(DetailCountryDeaths data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> detailCountryDeathsToJson(DetailCountryDeaths entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}