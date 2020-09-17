import 'dart:async';

import 'package:flutter/services.dart';

class PluginExample {
  static const MethodChannel _channel =
      const MethodChannel('PluginDemo');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> showAlert() async {
    return await _channel.invokeMethod('showAlert');
  }
}
