import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/models/eventRegisterModel.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeUnderCA {
  EventRegister eventRegister;
  Response response;
  Dio fetchIndEvent = Dio()..options.baseUrl = (Urls.URL_CA_EDIT);

  Future changeCa(BuildContext context, String under_ca) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    print(under_ca);
    formData.add("underCA", under_ca);
    formData.add("token", token);
    response = await fetchIndEvent.post('', data: formData);
    print(response);
    eventRegister = EventRegister.fromJson(json.decode(response.data));
    if (eventRegister.status == "success") {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Error"),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
