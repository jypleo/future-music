import 'package:flutter/material.dart';
import 'package:future_music/pages/home/home_controller.dart';
import 'package:future_music/pages/recommend/recom_view.dart';
import 'package:future_music/utils/adapt.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  final HomeController controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: controller.changePage,
            controller: controller.pageController,
            children: const [RecomPage()],
          ))
        ],
      ),
    );
  }
}
