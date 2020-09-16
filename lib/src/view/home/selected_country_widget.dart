import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';
import 'package:getxexample/src/view/commons/common_general_case_widget.dart';

class SelectedCountryWidget extends StatelessWidget {
  final GlobalController _globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildCountriesDropdown(),
          CommonGeneralCaseWidget(),
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
                  value: val.iso3 == null ? "" : val.iso3.toString(),
                  child: Text(
                    val.name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            print("cek value $value");
            if (value == "") {
              Get.snackbar("Error", "Data is empty");
            } else {
              _globalController.selectedCountries.value = value;
              print("New Value : ${_globalController.selectedCountries.value}");
            }
          },
        ),
      ),
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
        onPressed: _globalController.isSelectedCountrySuccess.value
            ? () {
                Get.toNamed('/detail');
              }
            : () {},
      ),
    );
  }
}
