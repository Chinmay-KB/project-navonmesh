import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/api_native.dart';
import 'package:project_navonmesh/homepage/loading_dialog.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class InnoPayment {
  String response = "";

  Future<String> getResponse(BuildContext context) async {
    showDialog(context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: LoadingDialog(),);
        });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    response = await ApiNative.PaymentCall(
        context: context, url: Urls.URL_INNO_PAYMENT, token: token);
    Post post = Post.fromJson(json.decode(response));
    String url = post.result.substring(10, post.result.length - 2);
    Navigator.pop(context);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    print(url);
  }
}

class Post {
  final String status;
  final String result;

  Post({this.status, this.result});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      status: json['status'],
      result: json['result'],
    );
  }
}
