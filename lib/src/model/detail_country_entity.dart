class DetailCountryEntity {
	Confirmed? confirmed;
	Confirmed? recovered;
	Confirmed? deaths;
	String? lastUpdate;

	DetailCountryEntity(
			{this.confirmed, this.recovered, this.deaths, this.lastUpdate});

	DetailCountryEntity.fromJson(Map<String, dynamic> json) {
		confirmed = json['confirmed'] != null
				? new Confirmed.fromJson(json['confirmed'])
				: null;
		recovered = json['recovered'] != null
				? new Confirmed.fromJson(json['recovered'])
				: null;
		deaths =
		json['deaths'] != null ? new Confirmed.fromJson(json['deaths']) : null;
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
