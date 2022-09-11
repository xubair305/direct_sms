import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'direct_sms_method_channel.dart';

abstract class DirectSmsPlatform extends PlatformInterface {
  /// Constructs a DirectSmsPlatform.
  DirectSmsPlatform() : super(token: _token);

  static final Object _token = Object();

  static DirectSmsPlatform _instance = MethodChannelDirectSms();

  /// The default instance of [DirectSmsPlatform] to use.
  ///
  /// Defaults to [MethodChannelDirectSms].
  static DirectSmsPlatform get instance => _instance;

  static const platform = MethodChannel('direct_sms');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DirectSmsPlatform] when
  /// they register themselves.
  static set instance(DirectSmsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  Future<void> sendSms({String? number, String? smsContent}) async {
    final String result =
        await platform.invokeMethod('directSms', <String, dynamic>{
      "phone": number,
      "msg": smsContent,
    });
    log(result);
  }
}
