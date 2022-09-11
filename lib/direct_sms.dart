import 'direct_sms_platform_interface.dart';

class DirectSms {
  Future<void> sendSms({required String phone, required String message}) {
    return DirectSmsPlatform.instance
        .sendSms(number: phone, smsContent: message);
  }
}
