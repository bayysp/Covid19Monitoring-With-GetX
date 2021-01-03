import 'package:get/get.dart';

import '../../network/covid_data_source.dart';
import '../global_controller.dart';

void bindingGlobalController() => Get.lazyPut<GlobalController>(
    () => GlobalController(covidDataSource: Get.find<CovidDataSource>()));
