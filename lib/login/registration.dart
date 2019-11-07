import 'dart:io';

import "package:flutter/material.dart";
import 'package:project_navonmesh/api/auth.dart';
import 'package:project_navonmesh/values/colors.dart';

class RegistrationScreen extends StatelessWidget {

  final nameTextFieldController=TextEditingController();
  final phoneTextFieldController=TextEditingController();
  final collegeTextFieldController=TextEditingController();
  final addressTextFieldController=TextEditingController();
  final emailTextFieldController=TextEditingController();
  final passwordTextFieldController=TextEditingController();

  Authentication auth=new Authentication();

  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery.of(context).devicePixelRatio;
    var textScalingFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: ColorValues.GRADIENT_STOPS_LOGIN_SCREEN,
                  colors: ColorValues.GRADIENT_COLOR_LOGIN_SCREEN)),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32.0*scalingFactor, bottom: 32.0*scalingFactor),
              child: Text("Registration",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),),
          ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: TextField(
                  controller: nameTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              GenderSelector(),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: phoneTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: collegeTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'College name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: addressTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: emailTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  controller: passwordTextFieldController,
                  cursorColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20 * textScalingFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20 * textScalingFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                    onPressed: () {
                      handleRegistration(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0*textScalingFactor
                        ),
                      ),
                    ),
                    textColor: Colors.white,
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    color: ColorValues.COLOR_BUTTON_LOGIN),
              ),
            ],
          ),
        ),
    );
  }

  handleRegistration(BuildContext context) async{
    try {
      final result = await InternetAddress.lookup('192.168.137.1');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        if(emailTextFieldController.text.isNotEmpty &&
            nameTextFieldController.text.isNotEmpty &&
            collegeTextFieldController.text.isNotEmpty &&
            phoneTextFieldController.text.isNotEmpty &&
            addressTextFieldController.text.isNotEmpty &&
            passwordTextFieldController.text.isNotEmpty){

          auth.registerUser(
            context: context,
            email: emailTextFieldController.text,
            password: passwordTextFieldController.text,
            name: nameTextFieldController.text,
            college: collegeTextFieldController.text,
            phoneno: phoneTextFieldController.text,
            address: addressTextFieldController.text,
            gender: switch_value?"male":"female");
        }
        else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Invalid input"),
            duration: Duration(seconds: 3),
          ));
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

}

bool switch_value=true;

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery.of(context).devicePixelRatio;
    var textScalingFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text("Gender",
          style: TextStyle(
              fontSize: 20 * textScalingFactor,
              fontWeight: FontWeight.w400,
              color: Colors.white)),
          Switch(value: switch_value,
            onChanged: (bool value){
            setState(() {
              switch_value=value;
            });
            },
            activeColor: Colors.lightBlue,
            inactiveThumbColor: Colors.pinkAccent,
            inactiveTrackColor: Colors.pink,
          ),
          Text(switch_value?"Male":"Female",
              style: TextStyle(
                  fontSize: 20 * textScalingFactor,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

