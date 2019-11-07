import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiNative {

  static var methodChannel = MethodChannel("API_CALL");

  static NativeCall({String url, String token, BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup(
          'google.com'); // TODO: Change this address
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString("token");
        String response = await methodChannel.invokeMethod('api_call',
            { "url": url,
              "token": token,
            });
        return response;
      }
      else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Invalid credentials'),
          duration: Duration(seconds: 3),
        ));
      }
    }
    on SocketException catch (_) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  static PaymentCall({String url, String token, BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup(
          'google.com'); // TODO: Change this address
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString("token");
        String response = await methodChannel.invokeMethod('payment_call',
            { "url": url,
              "token": token,
            });
        return response;
      }
      else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Invalid credentials'),
          duration: Duration(seconds: 3),
        ));
      }
    }
    on SocketException catch (_) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  static EventPaymentCall(
      {String url, String token, String eid, String title, BuildContext context}) async {
    try {
      final result = await InternetAddress.lookup(
          'google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString("token");
        String response = await methodChannel.invokeMethod(
            'workshop_payment_call',
            { "url": url,
              "token": token,
              "eid": eid,
              "title": title,
            });
        return response;
      }
      else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Invalid credentials'),
          duration: Duration(seconds: 3),
        ));
      }
    }
    on SocketException catch (_) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

}