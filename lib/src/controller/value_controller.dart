import 'package:get/state_manager.dart';

class ValueController extends GetxController{
  var count = 0.obs;
  increment() => count.value++;
}