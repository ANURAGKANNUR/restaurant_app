


import 'package:get/get.dart';
import 'package:restaurant/app/modules/restaurants/controller/restaurants_page_controller.dart';

class RestaurantBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(RestaurantsController());
  }
}