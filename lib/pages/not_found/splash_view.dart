import 'package:flutter/material.dart';
import 'package:future_music/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class NotFoundPage extends GetView<SplashController> {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Text(
          '错误页面',
        )));
  }
}
