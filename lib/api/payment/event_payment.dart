import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPayment {
  Response response;
  Dio workshopPayment = Dio()..options.baseUrl = (Urls.URL_WORKSHOP_PAYMENT);

  getResponse(BuildContext context, String eid, String title) async {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Dialog(
                child: Container(
                  width: HomepageCardsizeApi(context).getScreenWidth() * 0.8,
                  height: HomepageCardsizeApi(context).getScreenWidth() * 0.4,
                  color: ColorValues.BACKGROUND_GRADIENT_3,
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Do not pay if paid already",
                              style: prefix0.TextStyle(color: Colors.white,
                                  fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      )),
                ),
              )
          );
        });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    formData.add("eid", eid);
    formData.add("token", token);
    formData.add("title", title);
    response = await workshopPayment.post('', data: formData);
    Post post = Post.fromJson(json.decode(response.data));
    print(response.data.toString());
    String url = post.result.substring(10, post.result.length - 2);
    Future.delayed(Duration(seconds: 1));
    Navigator.pop(context);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
