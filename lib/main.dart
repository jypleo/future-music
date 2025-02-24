import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:future_music/commons/player/player_service.dart';
import 'package:future_music/commons/res/app_pages.dart';
import 'package:future_music/commons/res/thems.dart';
import 'package:future_music/services/auth_service.dart';
import 'package:future_music/vmusic/handle/music_handle.dart';
import 'package:future_music/vmusic/playing_controller.dart';
import 'package:get/get.dart';
import 'package:future_music/commons/net/init_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(const MainAppPage());
}

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '姜来',
      theme: SFThemes.lightTheme,
      darkTheme: SFThemes.darkTheme,
      themeMode: SFThemes.themeMode(),
      getPages: Routes.getPages,
      initialRoute: '/splash',
      initialBinding: BindingsBuilder(() {
        Get.put(AuthService());
        Get.put(PlayerService());
        Get.put(PlayingController());
      }),
    );
  }
}

Future<void> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initGetService(GetIt.instance);
}

Future<void> _initGetService(GetIt getIt) async {
  //创建一个优雅配置的AudioPlayer
  final audioPlayer = AudioPlayer(
    audioLoadConfiguration: const AudioLoadConfiguration(
      // Optimize buffer management
      androidLoadControl: AndroidLoadControl(
        // Reduce minimum buffer to prevent backup
        minBufferDuration: Duration(seconds: 3),
        // Set reasonable maximum to balance memory usage
        maxBufferDuration: Duration(seconds: 8),
        // Increase initial playback buffer for smoother start
        bufferForPlaybackDuration: Duration(milliseconds: 500),
        // Add some safety margin after rebuffering
        bufferForPlaybackAfterRebufferDuration: Duration(seconds: 1),
        // Set target buffer size to reduce memory pressure
        targetBufferBytes: 2 * 1024 * 1024,
      ),
    ),
  );

  getIt.registerSingleton<AudioPlayer>(audioPlayer);
  // hive是数据库
  await Hive.initFlutter('music');
  getIt.registerSingleton<Box>(await Hive.openBox('cache'));

  await HttpManager.init(debug: false);

  final musicHandler = await AudioService.init<MusicHandle>(
    builder: () => MusicHandle(),
    config: const AudioServiceConfig(
      // Android 通知栏配置
      androidNotificationChannelId: 'com.example.yun_music',
      androidNotificationChannelName: '网易云音乐',
      androidNotificationChannelDescription: '音乐播放控制',
      androidNotificationIcon: 'mipmap/ic_launcher',
      androidShowNotificationBadge: true,
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,

      // 通知栏显示选项
      notificationColor: Color(0xFFe72d2c),
      artDownscaleWidth: 300,
      artDownscaleHeight: 300,

      // 快速启动配置
      fastForwardInterval: Duration(seconds: 10),
      rewindInterval: Duration(seconds: 10),
    ),
  );

  getIt.registerSingleton<MusicHandle>(musicHandler);
}
