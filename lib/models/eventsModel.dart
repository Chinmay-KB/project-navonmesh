import 'dart:convert';

import 'package:dio/dio.dart';

EventsModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return EventsModel.fromJson(jsonData);
}

String userModelToJson(EventsModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

EventsModel fetchUser(Response response) {
  print(response);
  return EventsModel.fromJson(json.decode(response.data));
}

class EventsModel {
  String status;
  String result;

  EventsModel({
    this.status,
    this.result,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => new EventsModel(
        status: json["status"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
      };
}
