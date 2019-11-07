import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_navonmesh/models/ApplyModel.dart';

class CompanyCheck {
  Response response;
  Dio dioReset = Dio()..options.baseUrl = Urls.URL_COMPANY_CHECK;

  Future<String> checkStatus({String company}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    formData.add("company", company.toLowerCase());
    formData.add("token", token);
    Apply apply;
    response = await dioReset.post('',
        data: formData);
    print(response.data);
    apply = Apply.fromJson(json.decode(response.data));
    if(apply.status=="Not registered")
      return apply.status;
    else return apply.result;
  }
}
