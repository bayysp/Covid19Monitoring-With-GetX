import 'package:get/get.dart';

import '../../network/covid_data_source.dart';

void bindingCovidDataSource() =>
    Get.lazyPut<CovidDataSource>(() => CovidDataSource());
