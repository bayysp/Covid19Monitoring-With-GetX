import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/model/global_entity.dart';
import 'package:getxexample/src/network/covid_data_source.dart';

class GlobalController extends GetxController {
  var globalEntity = GlobalEntity().obs;

  var lastUpdate = "-".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;

//  Map<String, double> dataMap = Map();

  @override
  void onInit() {
    print("GlobalController - onInit");
    _fetchGlobalData();
    super.onInit();
  }

  void _fetchGlobalData() async {
    try {

      var data = await CovidDataSource.instance.loadGlobalData();
      globalEntity.value = GlobalEntity().fromJson(data);

      lastUpdate.value = globalEntity.value.lastUpdate.toString();
      confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
      recoveredTotal.value = globalEntity.value.recovered.value.toDouble();
      deathTotal.value = globalEntity.value.deaths.value.toDouble();

    } catch (_) {
      debugPrint("GlobalController - onCatch error ");
    }
  }
}
