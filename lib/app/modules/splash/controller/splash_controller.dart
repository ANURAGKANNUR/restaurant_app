


import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
class SplashController extends GetxController{


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 2)).then((value) async {

      Get.offAllNamed(Routes.loginPage);
      // }
    });
  }
}