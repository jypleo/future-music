import 'package:flutter/material.dart';
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
      // builder: (context, child) {
      //   return Stack(
      //     children: [
      //       child!,
      //       if (context.isDarkMode)
      //         IgnorePointer(
      //           child: Container(
      //             color: Colors.black12,
      //           ),
      //         )
      //     ],
      //   );
      // },
    );
  }
}
