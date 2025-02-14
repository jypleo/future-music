import 'package:flutter/material.dart';
import 'package:future_music/commons/res/app_thems.dart';
import 'package:future_music/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController>{
  const SplashPage({super.key})
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppThems.appMain,
    );
  }

}