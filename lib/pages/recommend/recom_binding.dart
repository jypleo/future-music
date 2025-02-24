import 'package:future_music/pages/recommend/recom_controller.dart';
import 'package:get/get.dart';

class RecomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecomController>(() => RecomController());
  }
}
