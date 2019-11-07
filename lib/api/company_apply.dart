import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_navonmesh/models/ApplyModel.dart';

class CompanyApply {

  Response response;
  Dio dioReset = Dio()..options.baseUrl = Urls.URL_COMPANY_APPLY;


  Future<String> apply({String company}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    FormData formData = FormData();
    formData.add("company", company.toLowerCase());
    formData.add("token", token);
    Apply apply;
    response = await dioReset.post('',
        data: formData);
    apply = Apply.fromJson(json.decode(response.data));
    print(apply.result);
    return apply.result;
  }
}
