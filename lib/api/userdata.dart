import 'package:shared_preferences/shared_preferences.dart';

 class Userdata{


  setSharedPreferences(Map<String, dynamic> result, String token) async{ //TODO:Just store the jwt
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("inno_id", result['data']['inno_id'].toString());
    preferences.setString("email", result['data']['email'].toString());
    preferences.setBool("loggedin", true);
    preferences.setString("token", token);

  }

  Future<String> getToken() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String token= preferences.getString("token");
    return token;
  }


  deleteSharedPreferences() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
  }





}