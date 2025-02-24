import 'package:future_music/api/common_service.dart';
import 'package:future_music/commons/values/constants.dart';
import 'package:future_music/commons/values/json.dart';
import 'package:future_music/pages/recommend/models/recom_model.dart';

class MusicApi {
  //获取首页内容
  static Future<RecomModel?> getRecomRec(
      {bool refresh = false, Map<String, dynamic>? cacheData}) async {
    // RecomModel? oldData;
    // if (cacheData != null) {
    //   oldData = RecomModel.fromJson(cacheData);
    // }
    // final response = await httpManager.get("/homepage/block/page", {
    //   'refresh': refresh,
    //   'cursor': oldData?.cursor ?? '',
    //   'timestamp': DateTime.now().millisecondsSinceEpoch
    // });
    // if (response.result) {
    //   try {
    //     final recmData = RecomModel.fromJson(response.data['data']);
    //     final responseBall =
    //         await httpManager.get("/homepage/dragon/ball", null);
    //     //缓存数字专辑Url
    //     final url = box.read(CACHE_ALBUM_POLY_DETAIL_URL);
    //     if (GetUtils.isNullOrBlank(url) == true) {
    //       (responseBall.data['data'] as List)
    //           .map((e) => Ball.fromJson(e))
    //           .toList()
    //           .forEach((element) {
    //         if (element.id == 13000) {
    //           box.write(CACHE_ALBUM_POLY_DETAIL_URL, element.url);
    //         }
    //       });
    //     }
    //     recmData.blocks.insert(
    //         1,
    //         Blocks("HOMEPAGE_BALL", SHOWTYPE_BALL, responseBall.data['data'],
    //             null, null, false));
    //     return _diffData(recmData, oldData);
    //   } catch (e) {
    //     print('请求失败');
    //     e.printError();
    //   }
    // }
    // return null;

    //请求失败，加载本地json
    final recomJson =
        await CommonService.jsonDecode(JsonStringConstants.discover_pages);
    final recmData = RecomModel.fromJson(recomJson['data']);
    final ballJson =
        await CommonService.jsonDecode(JsonStringConstants.discover_balls);
    recmData.blocks.insert(
        1,
        Blocks("HOMEPAGE_BALL", SHOWTYPE_BALL, ballJson['data'], null, null,
            false));
    return recmData;
  }
}
