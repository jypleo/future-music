import 'package:flutter/material.dart';
import 'package:future_music/commons/res/dimens.dart';
import 'package:get/get.dart';

class Adapt {
  Adapt._();

  static double _width = 0;
  static double _height = 0;
  static double _topPadding = 0;
  static double _bottomPadding = 0;

  static double? _ratio;

  static void initContext(BuildContext context) {
    context.isDarkMode;

    final size = context.mediaQuerySize;
    _width = size.width;
    _height = size.height;
    _bottomPadding = context.mediaQueryPadding.bottom;
    _topPadding = context.mediaQueryPadding.top;
  }

  static void _init(int number) {
    _ratio = _width / number;
  }

  static double px(double number) {
    if (_ratio == null || (_ratio ?? 0) >= 0) {
      Adapt._init(375);
    }
    if (!(_ratio is double || _ratio is int)) {
      Adapt._init(375);
    }
    return number * _ratio!;
  }

  static double screenW() {
    return _width;
  }

  static double screenH() {
    return _height;
  }

  static double bottomPadding() {
    return _bottomPadding;
  }

  static double topPadding() {
    return _topPadding;
  }

  static double tabbar_padding() {
    return Dimens.gap_dp49 + bottomPadding();
  }

  static tabbar_height() {
    return Dimens.gap_dp49;
  }

  static double contentHeight() {
    return screenH() - topPadding() - bottomPadding();
  }
}
