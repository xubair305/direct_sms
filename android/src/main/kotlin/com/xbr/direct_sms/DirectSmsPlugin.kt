package com.xbr.direct_sms

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.telephony.SmsManager
import android.os.Bundle


/** DirectSmsPlugin */
class DirectSmsPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  
  private val CHANNEL = "direct_sms"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if(call.method == "directSms"){   
      
      val num: String = call.argument<String>("phone").toString()
      val msg: String = call.argument<String>("msg").toString()
      sendSMS(num, msg, result)
      
    }else{
      result.notImplemented()
    }
  }

  fun sendSMS(phoneNo: String, msg: String, result: MethodChannel.Result) {
    try {
        val smsManager: SmsManager = SmsManager.getDefault()
        smsManager.sendTextMessage(phoneNo, null, msg, null, null)
        result.success("SMS send successfully")
    } catch (ex: java.lang.Exception) {
        ex.printStackTrace()
        result.error("Err", "Sms Not Sent", "")
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

