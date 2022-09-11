import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'direct_sms_platform_interface.dart';

/// An implementation of [DirectSmsPlatform] that uses method channels.
class MethodChannelDirectSms extends DirectSmsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('direct_sms');

  @override
  Future<void> sendSms({String? number, String? smsContent}) async {
    final String result =
        await methodChannel.invokeMethod('directSms', <String, dynamic>{
      "phone": number,
      "msg": smsContent,
    });
    log(result);
  }
}
