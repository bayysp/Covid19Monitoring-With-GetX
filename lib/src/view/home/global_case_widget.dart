import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/global_controller.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalCaseWidget extends StatelessWidget {
  final GlobalController _globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildStatisticData()),
          Expanded(child: _buildChart()),
        ],
      ),
    );
  }

  Widget _buildStatisticData() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemConfirmed(),
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemRecovered(),
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemDeaths(),
          Padding(padding: EdgeInsets.only(top: 8)),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      child: Obx(
        () => PieChart(
          chartType: ChartType.ring,
          showLegends: false,
          dataMap: showChartData(),
          colorList: [Colors.white, Colors.greenAccent, Colors.redAccent],
          chartValueStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _itemConfirmed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Confirmed",
          style: TextStyle(fontSize: 18),
        ),
        Obx(
          () => Text(
            _globalController.confirmedTotal.value.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _itemRecovered() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Recovered",
          style: TextStyle(fontSize: 18),
        ),
        Obx(
          () => Text(
            _globalController.recoveredTotal.value.toString(),
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _itemDeaths() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Deaths",
          style: TextStyle(fontSize: 18),
        ),
        Obx(
          () => Text(
            _globalController.deathTotal.value.toString(),
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Map<String, double> showChartData() {
    Map<String, double> res = Map();
    res.putIfAbsent(
        "Confirmed", () => _globalController.confirmedTotal.value.toDouble());
    res.putIfAbsent(
        "Recovered", () => _globalController.recoveredTotal.value.toDouble());
    res.putIfAbsent(
        "Deaths", () => _globalController.deathTotal.value.toDouble());
    return res;
  }
}
