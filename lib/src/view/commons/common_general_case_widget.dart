import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';

class CommonGeneralCaseWidget extends StatelessWidget {
  final GlobalController _globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _detailSelectedCountry(),
    );
  }

  Widget _detailSelectedCountry() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _confirmedItem(),
          _dividerItem(),
          _recoveredItem(),
          _dividerItem(),
          _deathsItem(),
        ],
      ),
    );
  }

  Widget _confirmedItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Confirmed", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(
            () => Text(
              _globalController.countryDetailConfirmed.value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recoveredItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Recovered", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(
            () => Text(
              _globalController.countryDetailRecovered.value.toString(),
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deathsItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Deaths", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(
            () => Text(
              _globalController.countryDetailDeaths.value.toString(),
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dividerItem() {
    return Container(
      color: Colors.black45,
      width: 1.0,
      height: Get.height * 0.05,
    );
  }
}
