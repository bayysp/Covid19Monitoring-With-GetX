import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';
import 'package:getxexample/src/view/home/global_case_widget.dart';
import 'package:getxexample/src/view/home/selected_country_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalController _globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19 Monitoring"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            _buildLastUpdateItem(),
            GlobalCaseWidget(),
            _buildSelectedCountryCaseWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLastUpdateItem() {
    return Container(
      child: Obx(
        () => Text("Last Update at : ${_globalController.lastUpdate.value}"),
      ),
    );
  }

  Widget _buildSelectedCountryCaseWidget() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 0.8,
          ),
        ],
      ),
      height: Get.height * 0.3,
      width: Get.width * 1,
      child: SelectedCountryWidget(),
    );
  }
}
