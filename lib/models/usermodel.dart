import 'dart:convert';

import 'package:dio/dio.dart';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

String userModelToJson(UserModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

UserModel fetchUser(Response response) {
  print(response);
  return UserModel.fromJson(json.decode(response.data));
}

class UserModel {
  String status;
  String result;

  UserModel({
    this.status,
    this.result,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
    status: json["status"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result,
  };
}

/*
class UserDetails {
  String userId;
  String username;
  String displayName;
  String displayPictureSmall;
  String displayPictureLarge;
  String email;

  UserDetails({
    this.userId,
    this.username,
    this.displayName,
    this.displayPictureSmall,
    this.displayPictureLarge,
    this.email,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => new UserDetails(
    userId: json["user_id"],
    username: json["username"],
    displayName: json["display_name"],
    displayPictureSmall: json["display_picture_small"],
    displayPictureLarge: json["display_picture_large"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "username": username,
    "display_name": displayName,
    "display_picture_small": displayPictureSmall,
    "display_picture_large": displayPictureLarge,
    "email": email,
  };
}*/
