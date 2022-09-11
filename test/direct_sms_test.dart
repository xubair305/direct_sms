import 'package:flutter_test/flutter_test.dart';
import 'package:direct_sms/direct_sms_platform_interface.dart';
import 'package:direct_sms/direct_sms_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDirectSmsPlatform
    with MockPlatformInterfaceMixin
    implements DirectSmsPlatform {
  @override
  Future<void> sendSms({String? number, String? smsContent}) {
    throw UnimplementedError();
  }
}

void main() {
  final DirectSmsPlatform initialPlatform = DirectSmsPlatform.instance;

  test('$MethodChannelDirectSms is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDirectSms>());
  });
}
