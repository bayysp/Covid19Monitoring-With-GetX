import 'package:get/get.dart';
import 'package:getxexample/src/controller/bindings/controller_dependency.dart';
import 'package:getxexample/src/controller/bindings/datasource_dependency.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindingCovidDataSource();
    bindingGlobalController();
  }
}
