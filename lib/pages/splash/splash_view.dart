import 'package:flutter/material.dart';
import 'package:future_music/commons/res/app_themes.dart';
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
        backgroundColor: AppThemes.app_main,
        body: Container(
            padding: EdgeInsets.only(top: 100),
            width: Adapt.screenW(),
            height: Adapt.screenH(),
            child: Column(children: [buildContent()])));
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
