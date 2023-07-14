import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreenPage extends GetView<SplashController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/restaurant_icon.png',height: 500,),
    );
  }
}
