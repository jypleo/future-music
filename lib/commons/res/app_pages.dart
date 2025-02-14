import 'package:get/get.dart';
class Route{
  static final List<GetPage<dynamic>> getPages=[
       //Splash
    CustomGetPage(
        name: '/splash',
        page: () => const SplashPage(),
        binding: SplashBinding()),
  ]

    static final unknownRoute = CustomGetPage(
      name: '/not_found',
      page: () => const NotFoundPage(),
      binding: NotFoundBinding());
}