import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/model/country_entity.dart';
import 'package:getxexample/src/model/global_entity.dart';
import 'package:getxexample/src/network/covid_data_source.dart';

class GlobalController extends GetxController {
  var _globalEntity = GlobalEntity().obs;
  var _countryEntity = CountryEntity().obs;

  var lastUpdate = "-".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;

  var countries = [].obs;
  var selectedCountries = "IDN".obs;

  @override
  void onInit() {
    print("GlobalController - onInit");
    _fetchGlobalData();
    _fetchCountries();

    super.onInit();
  }

  void _fetchGlobalData() async {
    try {
      var data = await CovidDataSource.instance.loadGlobalData();
      _globalEntity.value = GlobalEntity().fromJson(data);

      lastUpdate.value = _globalEntity.value.lastUpdate.toString();
      confirmedTotal.value = _globalEntity.value.confirmed.value.toDouble();
      recoveredTotal.value = _globalEntity.value.recovered.value.toDouble();
      deathTotal.value = _globalEntity.value.deaths.value.toDouble();
    } catch (_) {
      debugPrint("GlobalController - onCatch error ");
    }
  }

  void _fetchCountries() async {
    try {
      var data = await CovidDataSource.instance.loadCountries();
      _countryEntity.value = CountryEntity().fromJson(data);

      countries.value = _countryEntity.value.countries;
    } catch (_) {}
  }
}
