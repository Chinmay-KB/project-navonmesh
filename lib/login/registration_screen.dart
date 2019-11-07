import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:project_navonmesh/api/auth.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/models/collegemodel.dart';
import 'package:project_navonmesh/values/colors.dart';

bool switch_value = true;
String ca_value = "0";
bool ca_switch = false;
final nameTextFieldController = TextEditingController();
final phoneTextFieldController = TextEditingController();
final addressTextFieldController = TextEditingController();
final emailTextFieldController = TextEditingController();
final passwordTextFieldController = TextEditingController();
final CATextFieldController = TextEditingController();

Authentication auth = new Authentication();

class RegistrationScreenNew extends StatefulWidget {
  @override
  _RegistrationScreenNewState createState() => _RegistrationScreenNewState();
}

class _RegistrationScreenNewState extends State<RegistrationScreenNew> {
  final _formKey = GlobalKey<FormState>();
  List<ListElement> list;
  String college;

  @override
  void initState() {
    super.initState();
    _loadJson();
    college = "Select College";
  }

  Future _loadJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/collegelist.json");
    final jsonResult = json.decode(data);
    list = Welcome
        .fromJson(jsonResult)
        .list;
    print(list.length);
  }

  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery.of(context).devicePixelRatio;
    var textScalingFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: ColorValues.GRADIENT_STOPS_LOGIN_SCREEN,
                        colors: ColorValues.GRADIENT_COLOR_LOGIN_SCREEN)),
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 32.0 * scalingFactor,
                        bottom: 32.0 * scalingFactor),
                    child: Text(
                      "Registration",
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                  child: TextField(
                    controller: nameTextFieldController,

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
                          borderRadius: BorderRadius.circular(4),
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
                          borderRadius: BorderRadius.circular(4),
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
                GestureDetector(
                  onTap: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Dialog(
                              child: Container(
                                width: HomepageCardsizeApi(context)
                                    .getScreenWidth() * 0.8,
                                height: HomepageCardsizeApi(context)
                                    .getScreenHeight() * 0.8,
                                color: Colors.transparent,
                                child: ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            college = list[index].instituteName;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            color: ColorValues.COLOR_CARD,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Text(
                                                list[index].instituteName,
                                                style: prefix0.TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0
                                                ),),
                                            )),
                                      );
                                    }),
                              ),
                            ),
                          );
                        });
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Card(
                          color: ColorValues.COLOR_TEXTFIELD_LOGIN,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                            child: Text(
                              college,
                              style: TextStyle(
                                  fontSize: 20 * textScalingFactor,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                  child: TextField(
                    controller: addressTextFieldController,

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
                          borderRadius: BorderRadius.circular(4),
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
                          borderRadius: BorderRadius.circular(4),
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
                          borderRadius: BorderRadius.circular(4),
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
                CaSwitch(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 100, right: 100),
                  child: Builder(builder: (BuildContext context) {
                    return RaisedButton(
                        onPressed: () {
                          handleRegistration(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0 * textScalingFactor),
                          ),
                        ),
                        textColor: Colors.white,
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        color: ColorValues.COLOR_BUTTON_LOGIN);
                  }),
                ),
              ],
            ),
          ],
        ));
  }

  handleRegistration(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('192.168.137.1');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        if (emailTextFieldController.text.isNotEmpty &&
            nameTextFieldController.text.isNotEmpty &&
            college.compareTo("Select College") != 0 &&
            phoneTextFieldController.text.isNotEmpty &&
            addressTextFieldController.text.isNotEmpty &&
            passwordTextFieldController.text.isNotEmpty) {
          if (!ca_switch || CATextFieldController.text.isNotEmpty)
            auth.registerUser(
                context: context,
                email: emailTextFieldController.text,
                password: passwordTextFieldController.text,
                name: nameTextFieldController.text,
                college: college,
                phoneno: phoneTextFieldController.text,
                address: addressTextFieldController.text,
                gender: switch_value ? "male" : "female",
                ca_res: (ca_switch) ? CATextFieldController.text : "0");
          else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Enter CA id"),
              duration: Duration(seconds: 3),
            ));
          }
        } else {
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text("Gender",
              style: TextStyle(
                  fontSize: 20 * textScalingFactor,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          Switch(
            value: switch_value,
            onChanged: (bool value) {
              setState(() {
                switch_value = value;
              });
            },
            activeColor: Colors.lightBlue,
            inactiveThumbColor: Colors.pinkAccent,
            inactiveTrackColor: Colors.pink,
          ),
          Text(switch_value ? "Male" : "Female",
              style: TextStyle(
                  fontSize: 20 * textScalingFactor,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

class CaSwitch extends StatefulWidget {
  @override
  _CaSwitchState createState() => _CaSwitchState();
}

class _CaSwitchState extends State<CaSwitch> {
  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery
        .of(context)
        .devicePixelRatio;
    var textScalingFactor = MediaQuery
        .of(context)
        .textScaleFactor;
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 10.0, top: 20.0),
      child: Row(
        children: <Widget>[
          Text("Registed under CA?",
              style: TextStyle(
                  fontSize: 20 * textScalingFactor,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          Switch(
            value: switch_value,
            onChanged: (bool value) {
              setState(() {
                switch_value = value;
              });
            },
            activeColor: Colors.lightBlue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.white38,
          ),
          SizedBox(
              width: 70.0,
              child: (switch_value) ? TextField(
                controller: CATextFieldController,
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
                    hintText: 'CA id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 20 * textScalingFactor,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),

              ) : Container()),
        ],
      ),
    );
  }
}
