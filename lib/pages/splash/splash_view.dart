import 'package:flutter/material.dart';
import 'package:future_music/commons/res/app_thems.dart';
import 'package:future_music/pages/splash/splash_controller.dart';
import 'package:future_music/utils/adapt.dart';
import 'package:future_music/utils/image_utils.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
        backgroundColor: AppThems.appMain,
        body: Container(
            padding: EdgeInsets.only(top: 100),
            width: Adapt.screenW(),
            height: Adapt.screenH(),
            child: Column(children: [
              Image.asset(
                'assets/anim/cif.webp',
              )
            ])));
  }

  Widget buildContent() {
    if (controller.isFirst) {
      return Image.asset(
        'assets/anim/cif.webp',
      );
    } else {
      return Image.asset(
        ImageUtils.getImagePath('erq'),
        height: 94,
        width: 94,
      );
    }
  }
}
