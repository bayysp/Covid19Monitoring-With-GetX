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

//    dataMap["Confirmed"] = confirmedTotal.value;
//    dataMap["Recovered"] = recoveredTotal.value;
//    dataMap["Deaths"] = deathTotal.value;

    _fetchGlobalData();
    super.onInit();
  }

  void _fetchGlobalData() async {
    try {
      //show loading
      Future.delayed(
        Duration.zero,
        () => Container(
            height: Get.height,
            width: Get.width,
            child: Center(child: CircularProgressIndicator())),
      );

      var data = await CovidDataSource.instance.loadGlobalData();
      globalEntity.value = GlobalEntity().fromJson(data);

      lastUpdate.value = globalEntity.value.lastUpdate.toString();
      confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
      recoveredTotal.value = globalEntity.value.recovered.value.toDouble();
      deathTotal.value = globalEntity.value.deaths.value.toDouble();

//      dataMap.putIfAbsent("Confirmed", () => confirmedTotal.value);
//      dataMap.putIfAbsent("Recovered", () => recoveredTotal.value);
//      dataMap.putIfAbsent("Deaths", () => deathTotal.value);

      Get.back();
    } catch (_) {
      debugPrint("GlobalController - onCatch error ");
    }
  }
}
