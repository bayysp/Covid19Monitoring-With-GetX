import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxexample/src/view/detail/detail_country_screen.dart';
import 'package:getxexample/src/view/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      ],theme: ThemeData.dark(),
    );
  }
}
