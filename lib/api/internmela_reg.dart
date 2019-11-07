import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/eventRegisterModel.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternmelaReg {
  EventRegister eventRegister;
  Response response;
  Dio fetchIndEvent = Dio()..options.baseUrl = (Urls.URL_INTERNMELA);

  regEvent(BuildContext context, String eid, String details) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    formData.add("eid", eid);
    formData.add("token", token);
    formData.add('details', details);
    response = await fetchIndEvent.post('', data: formData);
    print(response);
    eventRegister = EventRegister.fromJson(json.decode(response.data));
    if (eventRegister.status == "registration done") {
      Navigator.of(context).pop();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) =>
              Event("105",
                  "special")));
    }
    else
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Error"),
        duration: Duration(seconds: 3),
      ));
  }
}