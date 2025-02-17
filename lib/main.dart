import 'package:flutter/material.dart';
import 'package:future_music/commons/res/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainAppPage());
}

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '姜来',
      getPages: Routes.getPages,
      initialRoute: '/splash',
    );
  }
}
