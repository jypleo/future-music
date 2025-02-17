import 'package:future_music/pages/not_found/splash_controller.dart';
import 'package:get/get.dart';

class NotFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotFoundController>(() => NotFoundController());
  }
}
