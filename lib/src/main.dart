import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/controller/bindings/sample_bind.dart';
import 'package:getxexample/src/controller/value_controller.dart';
import 'package:getxexample/src/view/detail/detail_country_screen.dart';
import 'package:getxexample/src/view/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailCountryScreen(),
        )
      ],
    );
  }
}

//class MyHomePage extends StatelessWidget {
//  final ValueController valueController = Get.put(ValueController());
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("title"),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Obx(() => Text("Value : " + valueController.count.string)),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: valueController.increment,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//}
