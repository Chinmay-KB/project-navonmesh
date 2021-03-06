import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/models/eventRegisterModel.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterEvent {
  EventRegister eventRegister;
  Response response;
  Dio fetchIndEvent = Dio()..options.baseUrl = (Urls.URL_EVENT_REGISTER);

  regEvent(BuildContext context, String eid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    formData.add("eid", eid);
    formData.add("token", token);
    response = await fetchIndEvent.post('', data: formData);
    print(response);
    eventRegister = EventRegister.fromJson(json.decode(response.data));
  }
}
