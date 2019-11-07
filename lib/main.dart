import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:project_navonmesh/homepage/homepage.dart';
import 'package:project_navonmesh/login/login_screen.dart';
import 'package:project_navonmesh/routes.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


SharedPreferences sp;
FirebaseAnalytics analytics = FirebaseAnalytics();
void main() async {
  sp=await SharedPreferences.getInstance();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      title: 'Innovision NIT Rourkela',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Montserrat',
        cursorColor: ColorValues.COLOR_EVENTS_LIGHT,
      ),
      home: Scaffold(
          resizeToAvoidBottomPadding: false  ,
          body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 3, milliseconds: 50)),
            builder: (context, result) {
              if (result.connectionState != ConnectionState.done)
                return SplashScreen.navigate(name: 'assets/splash.flr',
                  next: MyHomePage(title: 'Innovision NIT Rourkela'),
                  startAnimation: 'intro',
                  backgroundColor: ColorValues.COLOR_CARD,);
              else
                return MyHomePage(title: 'Innovision NIT Rourkela');
            },
          )
      ),
      routes:routes,
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  String title="Dumb";
  bool loggedin;

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    //checkLoggedIn(context);
    return FutureBuilder(
      future: checkLoggedIn(context),
      builder: (context,result){
        if (!loggedin)
          return LoginScreen();
        else
          return Homepage(); // TODO: Handle token expiration
      },
    );
  }

  Future<String> checkLoggedIn(BuildContext context){
    loggedin=(sp.getBool("loggedin")??false);

    /*if(loggedin){
      Navigator.of(context).pushReplacementNamed('/homepage');
    }
    else{
      Navigator.of(context).pushNamed('/login');
    }*/
    return null ;
  }

  versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion = double.parse(
        info.version.trim().replaceAll(".", ""));
    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      remoteConfig.getString('VERSION');
      String URL_PLAYSTORE = remoteConfig.getString("PLAY_STORE_URL");
      double newVersion = double.parse(remoteConfig
          .getString('VERSION')
          .trim()
          .replaceAll(".", ""));
      print(newVersion);
      print(currentVersion);
      if (newVersion > currentVersion) {
        _showVersionDialog(context, URL_PLAYSTORE);
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  _showVersionDialog(context, URL_PLAYSTORE) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message =
            "There is a newer version of app available please update it now to avail new features.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text(btnLabel),
                onPressed: () => _launchURL(URL_PLAYSTORE),
              ),
              FlatButton(
                child: Text(btnLabelCancel),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}