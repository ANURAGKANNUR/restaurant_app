part of '../../app/routes/app_pages.dart';

abstract class Routes {
  Routes._();
  static const loginPage = _Paths.loginPage;
  static const restaurantsPage=_Paths.restaurantsPage;
  static const restaurantDetailPage=_Paths.restaurantDetailPage;
  static const splashScreenPage=_Paths.splashScreenPage;
}

abstract class _Paths {
  _Paths._();
  static const loginPage = '/loginPage';
  static const restaurantsPage='/restaurantsPage';
  static const restaurantDetailPage='/restaurantDetailPage';
  static const splashScreenPage='/splashScreenPage';


}
