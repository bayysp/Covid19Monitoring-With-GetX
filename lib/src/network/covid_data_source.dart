import 'package:getxexample/src/network/base_network.dart';

class CovidDataSource{
  static CovidDataSource instance = CovidDataSource();

  Future<Map<String,dynamic>> loadGlobalData(){
    return BaseNetwork.get("");
  }
}