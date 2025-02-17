import 'package:flutter/material.dart';
import 'package:future_music/commons/res/app_thems.dart';
import 'package:future_music/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThems.appMain,
        body: Container(
            padding: EdgeInsets.only(top: 100),
            width: 100,
            height: 100,
            child: Column(children: [
              Image.asset(
                'assets/anim/cif.webp',
              )
            ])));
  }
}
