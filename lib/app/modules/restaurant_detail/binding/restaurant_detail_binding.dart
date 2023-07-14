
import 'package:get/get.dart';
import 'package:restaurant/app/modules/restaurant_detail/controller/restaurant_detail_controller.dart';

class RestaurantDetailBindng extends Bindings{

  @override
  void dependencies() {
    Get.put(RestaurantDetailController());
  }
}