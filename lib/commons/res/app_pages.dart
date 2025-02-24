import 'package:flutter/material.dart';
import 'package:future_music/pages/home/home_binding.dart';
import 'package:future_music/pages/home/home_view.dart';
import 'package:future_music/pages/not_found/splash_binding.dart';
import 'package:future_music/pages/not_found/splash_view.dart';
import 'package:future_music/pages/splash/splash_binding.dart';
import 'package:future_music/pages/splash/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> getPages = [
    //Splash
    CustomGetPage(
        name: '/splash',
        page: () => const SplashPage(),
        binding: SplashBinding()),
    CustomGetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
  ];

  static final unknownRoute = CustomGetPage(
      name: '/not_found',
      page: () => const NotFoundPage(),
      binding: NotFoundBinding());
}

class CustomGetPage extends GetPage<dynamic> {
  bool? fullscreen = false;
  CustomGetPage(
      {required super.name,
      required super.page,
      super.binding,
      this.fullscreen,
      super.transitionDuration,
      super.customTransition,
      super.preventDuplicates,
      super.transition = Transition.native})
      : super(
            curve: Curves.linear,
            showCupertinoParallax: false,
            popGesture: false,
            fullscreenDialog: fullscreen != null && fullscreen);
}
