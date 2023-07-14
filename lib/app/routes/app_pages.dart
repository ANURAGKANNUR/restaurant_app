import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurant/app/modules/restaurant_detail/binding/restaurant_detail_binding.dart';
import 'package:restaurant/app/modules/restaurant_detail/views/restaurant_detail_page.dart';
import 'package:restaurant/app/modules/restaurants/views/restaurants_page.dart';
import 'package:restaurant/app/modules/splash/binding/splash_binding.dart';
import 'package:restaurant/app/modules/splash/views/splash_screen_page.dart';

import '../modules/login/binding/login_binding.dart';
import '../modules/login/views/login_page.dart';
import '../modules/restaurants/binding/resturants_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreenPage;

  static final routes = [
    GetPage(
        name: _Paths.loginPage,
        page: () => LoginPage(),
        binding: LOginBinding()),
    GetPage(
        name: _Paths.restaurantsPage,
        page: () => RestaurantsPage(),
        binding: RestaurantBinding()),
    GetPage(
        name: _Paths.restaurantDetailPage,
        page: () => RestaurantDetailPage(),
        binding: RestaurantDetailBindng()),
    GetPage(name: _Paths.splashScreenPage, page: ()=>SplashScreenPage(),binding: SplashBinding())
  ];
}
