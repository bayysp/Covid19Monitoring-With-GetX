import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';

class HomeDetailCountryWidget extends StatelessWidget {
  final List<String> lists = ["123", "121", "141"];

  final GlobalController _globalController = Get.find();
  String _selectedLocation = "IDN";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        _buildCountriesDropdown(),
      ],
    ));
  }

  Widget _buildCountriesDropdown() {
    return Container(
      width: Get.width * 0.8,
      child: Obx(
        () => DropdownButton(
          value: _globalController.selectedCountries.value,
          elevation: 16,
          isExpanded: true,
          dropdownColor: Colors.white.withOpacity(0.8),
          underline: Container(
            height: 2,
            color: Colors.black38,
          ),
          items: _globalController.countries.value
              .map(
                (val) => DropdownMenuItem(
                  value: val.iso3.toString(),
                  child: Text(val.name.toString()),
                ),
              )
              .toList(),
          onChanged: (value) {
            _globalController.selectedCountries.value = value;
          },
        ),
      ),
    );
  }
}
