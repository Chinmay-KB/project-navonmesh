// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<ListElement> list;

  Welcome({
    this.list,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  String instituteName;

  ListElement({
    this.instituteName,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        instituteName: json["Institute name"],
      );

  Map<String, dynamic> toJson() => {
        "Institute name": instituteName,
      };
}
