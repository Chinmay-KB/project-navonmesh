import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/models/LocationModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Locations extends StatefulWidget {

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<Venues> list;

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
                        "Event Locations",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _loadJson(),
                    builder: (context, response) {
                      if (response.connectionState == ConnectionState.done) {
                        return Container(
                          width: HomepageCardsizeApi(context).getScreenWidth(),
                          height: HomepageCardsizeApi(context)
                              .getScreenHeight() * 0.9,
                          child: GridView.builder(
                            itemCount: list.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _launchUrl(list[index].mapsUrl);
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        list[index].venue,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      else
                        return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future _loadJson() async {
    String data =
    await DefaultAssetBundle.of(context).loadString("assets/venues.json");
    final jsonResult = json.decode(data);
    venueModel venueResult = venueModel.fromJson(jsonResult);
    list = venueResult.venues;
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
