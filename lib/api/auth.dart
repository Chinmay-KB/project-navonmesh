import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/jwt.dart';
import 'package:project_navonmesh/api/userdata.dart';
import 'package:project_navonmesh/homepage/loading_dialog.dart';
import 'package:project_navonmesh/models/usermodel.dart';
import 'package:project_navonmesh/values/urls.dart';

class Authentication {

  UserModel user;
  Response response;
  Dio dioLogin = Dio()
    ..options.baseUrl = Urls.URL_LOGIN;
  Dio dioRegister = Dio()
    ..options.baseUrl = Urls.URL_REGISTRATION;

  Userdata userdata=new Userdata();


  void loginUser({BuildContext context,String email, String password}) async {
    showDialog(context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: LoadingDialog(),);
        });
    FormData formData = FormData();
    formData.add("email", email);
    formData.add("password", password);
    response = await dioLogin.post('', data: formData, options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        }
    ));

    user = fetchUser(response);
    if (user.status == "success") {
      print(response.data.toString()); //TODO: Handle this Scaffold
      /*Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Login successful'),
        duration: Duration(seconds: 3),
      ));*/
      var data=parseJwt(user.result);
      userdata.setSharedPreferences(data, user.result);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/homepage', (Route<dynamic> route) => false);
    }
    else {
      Navigator.pop(context);
      print(response.data.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(user.result),
        duration: Duration(seconds: 3),
      ));
    }
  }

  void registerUser({BuildContext context, String email, String password, String name, String address, String gender, String phoneno, String college, String ca_res}) async {
    FormData formData = FormData();
    formData.add("name", name);
    formData.add("gender", gender);
    formData.add("phone", phoneno);
    formData.add("college", college);
    formData.add("address", address);
    formData.add("email", email);
    formData.add("password", password);
    formData.add("ca_res", ca_res);
    showDialog(context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: LoadingDialog(),);
        });
    response = await dioRegister.post('', data: formData);

    user = fetchUser(response);
    if (user.status == "success") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Login successful'),
        duration: Duration(seconds: 3),
      ));
      loginUser(context: context, email: email, password: password);
    }


    /* Navigator.of(context).pushNamedAndRemoveUntil(
          '/homepage', (Route<dynamic> route) => false);
    }*/
    else {
      Navigator.pop(context);
      print(response.data.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(user.result),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
