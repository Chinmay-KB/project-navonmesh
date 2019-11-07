import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/internmela_reg.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/values/colors.dart';

class InternMela extends StatefulWidget {
  @override
  _InternMelaState createState() => _InternMelaState();
}

class _InternMelaState extends State<InternMela> {
  TextEditingController cgpaTextFieldController = new TextEditingController();

  TextEditingController cvTextFieldController = new TextEditingController();

  TextEditingController backTextFieldController = new TextEditingController();

  String grad_year = "Select";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    "Internmela Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Graduation year",
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownButton<String>(
                      hint: Text(
                        grad_year,
                        style: TextStyle(color: Colors.white),
                      ),
                      disabledHint: Text(
                        "Graduation Year",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      items: <String>['2020', '2021', '2022', '2023', '2024']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          grad_year = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: cgpaTextFieldController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20,
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
                      hintText: 'Current CGPA',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
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
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: cvTextFieldController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Link to CV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
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
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                child: TextField(
                  controller: backTextFieldController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                      fontSize: 20,
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
                      hintText: 'Active Backlogs',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
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
              Center(
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, left: 100, right: 100),
                  child: Builder(builder: (BuildContext context) {
                    return RaisedButton(
                        onPressed: () {
                          if (grad_year != "Select" &&
                              cgpaTextFieldController.text.isNotEmpty &&
                              cvTextFieldController.text.isNotEmpty &&
                              backTextFieldController.text.isNotEmpty) {
                            String cgpa = cgpaTextFieldController.text;
                            String cv = cvTextFieldController.text;
                            String backlog = backTextFieldController.text;
                            String details =
                                "{ \"grad_year\": \"$grad_year\",\"cgpa\": \"$cgpa\",\"cv\": \"$cv\",\"backlogs\": \"$backlog\"}";

                            InternmelaReg().regEvent(context, "105", details);
                          } else
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid details"),
                              duration: Duration(seconds: 3),
                            ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.0),
                          ),
                        ),
                        textColor: Colors.white,
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        color: ColorValues.COLOR_BUTTON_LOGIN);
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
