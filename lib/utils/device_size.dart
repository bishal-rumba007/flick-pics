


import 'package:flutter/material.dart';

class DeviceSize{
  static double? _width;
  static double? _height;

  static double get width {
    _width ??= MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return _width!;
  }

  static double get height {
    _height ??= MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    return _height!;
  }
}