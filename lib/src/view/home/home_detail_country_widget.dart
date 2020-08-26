import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';

class HomeDetailCountryWidget extends StatelessWidget {
  final GlobalController _globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildCountriesDropdown(),
          _detailSelectedCountry(),
          _buildButtonDetail(),
        ],
      ),
    );
  }

  Widget _buildCountriesDropdown() {
    return Container(
      width: Get.width * 0.8,
      child: Obx(
        () => DropdownButton(
          hint: Text("Choose Country"),
          value: _globalController.selectedCountries.value,
          elevation: 16,
          isExpanded: true,
          dropdownColor: Colors.black.withOpacity(0.6),
          autofocus: true,
          underline: Container(
            height: 2,
            color: Colors.black38,
          ),
          items: _globalController.countries.value
              .map(
                (val) => DropdownMenuItem(
                  value: val.iso3.toString(),
                  child: Text(
                    val.name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            _globalController.selectedCountries.value = value;
            print("New Value : ${_globalController.selectedCountries.value}");
          },
        ),
      ),
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

  Widget _buildButtonDetail() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 0.8,
          ),
        ],
      ),
      child: RaisedButton(
        child: Text("See Detail"),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.lightBlueAccent.withOpacity(0.5),
        onPressed: () {
          Get.toNamed('/detail');
        },
      ),
    );
  }
}
