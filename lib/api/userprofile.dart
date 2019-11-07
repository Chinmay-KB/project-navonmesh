import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/api_native.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProfile {
  String response ="";
  Future<String> getResponse(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    response = await ApiNative.NativeCall(context:context,url:Urls.URL_PROFILE,token: token );
    return response;
  }
}