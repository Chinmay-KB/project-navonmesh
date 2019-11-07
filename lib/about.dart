import 'package:flutter/material.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/values/constants.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "ABOUT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffa29bfe),
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/inno_logo.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Text("Innovision",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/nitrkl.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Text("SAC",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Constants.ABOUT_1,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      _launchUrl(Urls.URL_PRIVACY_POLICY);
                    },
                    color: Colors.pink,
                    child: Text(
                      "Privacy policy",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Made at NIT Rourkela",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Developer- Chinmay Kabi",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    contactButton("Github", Urls.URL_GITHUB),
                    contactButton("Twitter", Urls.URL_TWITTER),
                    contactButton("Facebook", Urls.URL_FACEBOOK)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget contactButton(String text, String url) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () {
        _launchUrl(url);
      },
      color: Colors.pink,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
