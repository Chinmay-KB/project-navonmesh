import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_navonmesh/models/resetPasswordModel.dart';
import 'package:project_navonmesh/values/urls.dart';

class PasswordReset {
  Response response;
  Dio dioReset = Dio()..options.baseUrl = Urls.URL_FORGOT_PASSWORD;

  void resetPassword({BuildContext context, String email}) async {
    FormData formData = FormData();
    formData.add("email", email);
    ResetPassword resetPassword;
    response = await dioReset.post('',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }));
    resetPassword = ResetPassword.fromJson(json.decode(response.data));
    if (resetPassword.status == "success") {
      print("Successfully reset");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(resetPassword.result),
        duration: Duration(seconds: 5),
      ));
    }
  }
}
