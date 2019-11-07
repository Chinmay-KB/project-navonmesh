import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/values/constants.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  detailsCard(
                      Constants.QUESTION_FAQ_1, Constants.ANSWERS_FAQ_1),
                  detailsCard(
                      Constants.QUESTION_FAQ_2, Constants.ANSWERS_FAQ_2),
                  detailsCard(
                      Constants.QUESTION_FAQ_3, Constants.ANSWERS_FAQ_3),
                  detailsCard(
                      Constants.QUESTION_FAQ_4, Constants.ANSWERS_FAQ_4),
                  detailsCard(
                      Constants.QUESTION_FAQ_5, Constants.ANSWERS_FAQ_5),
                  detailsCard(
                      Constants.QUESTION_FAQ_6, Constants.ANSWERS_FAQ_6),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget detailsCard(String title, String details) {
    return Card(
      color: Colors.transparent,
      child: ExpandablePanel(
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          hasIcon: true,
          iconPlacement: ExpandablePanelIconPlacement.right,
          header: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          expanded: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
            child: Text(
              details,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
