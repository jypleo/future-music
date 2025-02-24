import 'package:json_annotation/json_annotation.dart';
import 'package:future_music/commons/models/search_video_model.dart';
import 'package:future_music/utils/common_utils.dart';

part 'simple_play_list_model.g.dart';

@JsonSerializable()
class SimplePlayListModel extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String? picUrl;

  @JsonKey(name: 'coverImgUrl')
  String? coverImgUrl;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'trackCount')
  int trackCount;

  @JsonKey(name: 'updateTime')
  int? updateTime;

  @JsonKey(name: 'officialTags')
  List<String>? officialTags;

  @JsonKey(name: 'creator')
  Creator? creator;

  SimplePlayListModel(
    this.id,
    this.name,
    this.picUrl,
    this.coverImgUrl,
    this.playCount,
    this.trackCount,
    this.updateTime,
    this.officialTags,
    this.creator,
  );

  factory SimplePlayListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SimplePlayListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SimplePlayListModelToJson(this);

  String getCoverUrl() {
    return picUrl ?? coverImgUrl ?? "";
  }

  String getCountAndBy() {
    return '$trackCount首 by ${creator?.name}, 播放${getPlayCountStrFromInt(playCount)}次';
  }
}
