

import 'package:json_annotation/json_annotation.dart';
import 'package:future_music/commons/models/song_model.dart';

part 'remd_song_daily_model.g.dart';

@JsonSerializable()
class RcmdSongDailyModel extends Object {
  @JsonKey(name: 'dailySongs')
  List<Song> dailySongs;

  @JsonKey(name: 'recommendReasons')
  List<RecommendReasons> recommendReasons;

  RcmdSongDailyModel(
    this.dailySongs,
    this.recommendReasons,
  );

  factory RcmdSongDailyModel.fromJson(Map<String, dynamic> srcJson) =>
      _$RcmdSongDailyModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RcmdSongDailyModelToJson(this);
}

@JsonSerializable()
class RecommendReasons extends Object {
  @JsonKey(name: 'songId')
  int songId;

  @JsonKey(name: 'reason')
  String reason;

  RecommendReasons(
    this.songId,
    this.reason,
  );

  factory RecommendReasons.fromJson(Map<String, dynamic> srcJson) =>
      _$RecommendReasonsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendReasonsToJson(this);
}
