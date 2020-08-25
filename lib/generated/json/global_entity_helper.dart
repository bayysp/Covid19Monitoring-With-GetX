import 'package:getxexample/src/model/global_entity.dart';

globalEntityFromJson(GlobalEntity data, Map<String, dynamic> json) {
	if (json['confirmed'] != null) {
		data.confirmed = new GlobalConfirmed().fromJson(json['confirmed']);
	}
	if (json['recovered'] != null) {
		data.recovered = new GlobalRecovered().fromJson(json['recovered']);
	}
	if (json['deaths'] != null) {
		data.deaths = new GlobalDeaths().fromJson(json['deaths']);
	}
	if (json['dailySummary'] != null) {
		data.dailySummary = json['dailySummary']?.toString();
	}
	if (json['dailyTimeSeries'] != null) {
		data.dailyTimeSeries = new GlobalDailyTimeSeries().fromJson(json['dailyTimeSeries']);
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['countries'] != null) {
		data.countries = json['countries']?.toString();
	}
	if (json['countryDetail'] != null) {
		data.countryDetail = new GlobalCountryDetail().fromJson(json['countryDetail']);
	}
	if (json['lastUpdate'] != null) {
		data.lastUpdate = json['lastUpdate']?.toString();
	}
	return data;
}

Map<String, dynamic> globalEntityToJson(GlobalEntity entity) {
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
	data['dailySummary'] = entity.dailySummary;
	if (entity.dailyTimeSeries != null) {
		data['dailyTimeSeries'] = entity.dailyTimeSeries.toJson();
	}
	data['image'] = entity.image;
	data['source'] = entity.source;
	data['countries'] = entity.countries;
	if (entity.countryDetail != null) {
		data['countryDetail'] = entity.countryDetail.toJson();
	}
	data['lastUpdate'] = entity.lastUpdate;
	return data;
}

globalConfirmedFromJson(GlobalConfirmed data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> globalConfirmedToJson(GlobalConfirmed entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}

globalRecoveredFromJson(GlobalRecovered data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> globalRecoveredToJson(GlobalRecovered entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}

globalDeathsFromJson(GlobalDeaths data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> globalDeathsToJson(GlobalDeaths entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['detail'] = entity.detail;
	return data;
}

globalDailyTimeSeriesFromJson(GlobalDailyTimeSeries data, Map<String, dynamic> json) {
	if (json['pattern'] != null) {
		data.pattern = json['pattern']?.toString();
	}
	if (json['example'] != null) {
		data.example = json['example']?.toString();
	}
	return data;
}

Map<String, dynamic> globalDailyTimeSeriesToJson(GlobalDailyTimeSeries entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pattern'] = entity.pattern;
	data['example'] = entity.example;
	return data;
}

globalCountryDetailFromJson(GlobalCountryDetail data, Map<String, dynamic> json) {
	if (json['pattern'] != null) {
		data.pattern = json['pattern']?.toString();
	}
	if (json['example'] != null) {
		data.example = json['example']?.toString();
	}
	return data;
}

Map<String, dynamic> globalCountryDetailToJson(GlobalCountryDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pattern'] = entity.pattern;
	data['example'] = entity.example;
	return data;
}