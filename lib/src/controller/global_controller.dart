import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/model/country_entity.dart';
import 'package:getxexample/src/model/detail_country_entity.dart';
import 'package:getxexample/src/model/global_entity.dart';
import 'package:getxexample/src/network/covid_data_source.dart';
import 'package:intl/intl.dart';

import '../network/covid_data_source.dart';

class GlobalController extends GetxController {
  CovidDataSource covidDataSource;

  GlobalController({this.covidDataSource});

  var globalEntity = GlobalEntity().obs;
  var _countryEntity = CountryEntity().obs;
  var _detailCountryEntity = DetailCountryEntity().obs;

  //for global
  var lastUpdate = "-".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;

  //for dropdown data
  var countries = [].obs;
  var selectedCountries = "IDN".obs;
  var countryDetailConfirmed = 0.obs;
  var countryDetailRecovered = 0.obs;
  var countryDetailDeaths = 0.obs;

  //for checking success or not
  var isSelectedCountrySuccess = false.obs;

  final numberFormat = NumberFormat("#,###");

  @override
  void onInit() {
    print("GlobalController - onInit");
    _fetchGlobalData();
    _fetchCountries();
    _fetchCountrySelected();

    super.onInit();
  }

  @override
  void onReady() {
    ever(selectedCountries, (_) {
      print("onready called , ${selectedCountries.value}");
      _fetchCountrySelected();
    });
    super.onReady();
  }

  void _fetchGlobalData() async {
    try {
      var data = await covidDataSource.loadGlobalData();
      globalEntity.value = GlobalEntity().fromJson(data);

      lastUpdate.value = DateFormat('yyyy-MM-dd HH:mm:ss')
          .format(DateTime.parse(globalEntity.value.lastUpdate));

      confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
      recoveredTotal.value = globalEntity.value.recovered.value.toDouble();
      deathTotal.value = globalEntity.value.deaths.value.toDouble();
    } catch (_) {
      debugPrint("GlobalController - onCatch error ");
    }
  }

  void _fetchCountries() async {
    try {
      var data = await covidDataSource.loadCountries();
      _countryEntity.value = CountryEntity().fromJson(data);

      countries.value = _countryEntity.value.countries;
    } catch (_) {}
  }

  void _fetchCountrySelected() async {
    try {
      var data =
          await covidDataSource.loadSelectedCountry(selectedCountries.value);
      print("data is $data");
      if (data.containsKey("error")) {
        print("GlobalController : contains key error true");
        isSelectedCountrySuccess.value = false;
        countryDetailConfirmed.value = 0;
        countryDetailRecovered.value = 0;
        countryDetailDeaths.value = 0;
      } else {
        isSelectedCountrySuccess.value = true;
        _detailCountryEntity.value = DetailCountryEntity().fromJson(data);
        countryDetailConfirmed.value =
            _detailCountryEntity.value.confirmed.value;
        countryDetailRecovered.value =
            _detailCountryEntity.value.recovered.value;
        countryDetailDeaths.value = _detailCountryEntity.value.deaths.value;
      }
      print("_fetchCountrySelected value ${countryDetailConfirmed.value}");
    } catch (_) {
      debugPrint("GlobalController - onCatch error ");
    }
  }
}
