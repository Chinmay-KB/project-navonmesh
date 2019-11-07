import 'package:flutter/material.dart';
import 'package:project_navonmesh/about.dart';
import 'package:project_navonmesh/api/userdata.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
  Userdata userdata = new Userdata();
  String username, inno_id;

  @override
  Widget build(BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Container(
        height: cardsizeApi.getScreenHeight(),
        color: ColorValues.BACKGROUND_GRADIENT_3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/profile');
                },
                child: drawerElements(Icons.account_box, "Profile")),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/location');
                },
                child: drawerElements(Icons.location_on, "Event Locations")),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/faq');
                },
                child: drawerElements(Icons.info_outline, "FAQ")),
            GestureDetector(
                onTap: () {
                  _launchSponsors();
                },
                child: drawerElements(Icons.star, "Sponsors")),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed('/about');
              },
              child: drawerElements(
                  Icons.perm_device_information, "About the app"),
            ),
            GestureDetector(
                onTap: () {
                  logout(context);
                },
                child: drawerElements(Icons.highlight_off, "Logout"))
          ],
        ));
  }

  Widget drawerElements(IconData iconData, String name) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconData,
              color: Colors.amberAccent,
              size: 40.0,
            ),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )
        ],
      ),
    );
  }

  logout(BuildContext context) {
    userdata.deleteSharedPreferences();
    //Navigator.of(context).pop();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  _launchSponsors() async {
    String url = Urls.URL_SPONSORS;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _basicUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    inno_id = preferences.getString("inno_id");
  }

}
