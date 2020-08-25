import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';
import 'package:getxexample/src/view/home/global_case_widget.dart';

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
            _buildGlobalDataInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildLastUpdateItem() {
    return Container(
      child: Obx(
        () => Text(
            "Last Update at ${_globalController.lastUpdate.value}"),
      ),
    );
  }

  Widget _buildGlobalDataInfo() {
    return GlobalCaseWidget();
  }
}
