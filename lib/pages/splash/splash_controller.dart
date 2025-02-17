import 'package:future_music/utils/common_utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final bool isFirst = box.read<bool>('isFirst') ?? true;
  @override
  void onInit() {
    super.onInit();
  }
}
