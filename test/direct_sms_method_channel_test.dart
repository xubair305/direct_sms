import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:direct_sms/direct_sms_method_channel.dart';

void main() {
  MethodChannelDirectSms platform = MethodChannelDirectSms();
  const MethodChannel channel = MethodChannel('direct_sms');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
