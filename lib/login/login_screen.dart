import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/auth.dart';
import 'package:project_navonmesh/login/forgotpassword_dialog.dart';
import 'package:project_navonmesh/login/registration_screen.dart';
import 'package:project_navonmesh/values/colors.dart';

class LoginScreen extends StatelessWidget {
  var emailTextFieldController = TextEditingController();
  var passwordTextFieldController = TextEditingController();

  Authentication auth = new Authentication();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery.of(context).devicePixelRatio;
    var textScalingFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: ColorValues.GRADIENT_STOPS_LOGIN_SCREEN,
                colors: ColorValues.GRADIENT_COLOR_LOGIN_SCREEN)),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Hero(
                    tag: 'inno_logo',
                    child: Image.asset(
                      'assets/images/inno_logo.png',
                      height: 40 * scalingFactor,
                      width: 40 * scalingFactor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20),
                  child: TextField(
                    controller: emailTextFieldController,
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
                    child: Builder(builder: (context) {
                      return RaisedButton(
                          onPressed: () {
                            handleLogin(context);
                            //loginUser(context, emailTextFieldController.text,passwordTextFieldController.text);
                            //Navigator.pushNamed(context, '/homepage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0 * textScalingFactor),
                            ),
                          ),
                          textColor: Colors.white,
                          elevation: 7.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: ColorValues.COLOR_BUTTON_LOGIN);
                    })),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(builder: (context) {
                          return RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreenNew()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  '    Register    ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              textColor: Colors.white,
                              elevation: 7.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              color: ColorValues.COLOR_BUTTON_LOGIN);
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(builder: (context) {
                          return RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassword()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              textColor: Colors.white,
                              elevation: 7.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              color: ColorValues.COLOR_BUTTON_LOGIN);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleLogin(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup(
          'google.com'); // TODO: Change this address
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        if (emailTextFieldController.text.isNotEmpty) {
          auth.loginUser(
              context: context,
              email: emailTextFieldController.text,
              password: passwordTextFieldController.text);
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Invalid credentials'),
            duration: Duration(seconds: 3),
          ));
        }
      }
    } catch (_) {
      print('not connected');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
