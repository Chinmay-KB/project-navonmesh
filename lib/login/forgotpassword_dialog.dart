import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/forgot_password.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/values/colors.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Background(),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Reset Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                  ),),
              ),
            ),
            Align(
              alignment: Alignment(0,-0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: emailTextFieldController,
                    enableInteractiveSelection: true,
                    style: TextStyle(
                        fontSize: 20,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                ),
                Builder(
                  builder: (context){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            PasswordReset().resetPassword(
                                context: context,
                                email: emailTextFieldController.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                          textColor: Colors.white,
                          elevation: 7.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: ColorValues.COLOR_BUTTON_LOGIN),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
    );
  }
}
