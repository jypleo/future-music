import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:future_music/commons/player/player_service.dart';
import 'package:future_music/commons/values/server.dart';
import '../models/song_model.dart';

extension QuitPlayerExt on BuildContext {
  PlayerService get playerService {
    try {
      return PlayerService.to;
    } catch (e, stacktrace) {
      logger.e(stacktrace.toString());
      rethrow;
    }
  }

  Rx<Song?> get curPlayRx {
    try {
      return PlayerService.to.curPlay;
    } catch (e, stacktrace) {
      logger.e(stacktrace.toString());
      rethrow;
    }
  }
}
