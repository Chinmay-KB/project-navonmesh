import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventIndividualUser {
  Response response;
  Dio fetchIndEvent = Dio()..options.baseUrl = (Urls.URL_EVENT_USER_INDIVIDUAL);

  Future<String> fetchEventDetails(BuildContext context, String eid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");

    FormData formData = FormData();
    formData.add("eid", eid);
    formData.add("token", token);
    response = await fetchIndEvent.post('', data: formData);
    return response.toString();
  }
}
