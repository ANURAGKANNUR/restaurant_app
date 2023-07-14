import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:restaurant/app/models/restaurents_model.dart';

import '../../../resource/all_restaurents.dart';

class RestaurantsController extends GetxController {
  
  var allRestaurants=Restaurants().obs;
  final _resources=Resources();

  @override
  onInit() {
    getRestaurants();
    super.onInit();
  }
  getRestaurants() async {
    try{
      EasyLoading.show();
      var response=await _resources.getAllRestaurants();
      allRestaurants.value=response;
      EasyLoading.dismiss();
    }catch(e){
      print(e);
    }
  }
}
