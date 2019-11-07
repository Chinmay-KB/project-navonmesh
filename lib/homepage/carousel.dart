import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/loadAllEvents.dart';
import 'package:project_navonmesh/bloc/bottom_appbar_provider.dart';
import 'package:project_navonmesh/homepage/events/eventsList.dart';
import 'package:project_navonmesh/homepage/homepage_card.dart';
import 'package:project_navonmesh/homepage/homepage_card_spotlight.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with AutomaticKeepAliveClientMixin {
  Future<Response> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = fetchEvent();
  }

  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery
        .of(context)
        .devicePixelRatio;
    return FutureBuilder(
      future: _future,
      builder: (context, result) {
        if (result.hasData && result.connectionState == ConnectionState.done) {
          allEventsModel eventsModel =
          allEventsModel.fromJson(json.decode(result.data.toString()));
          CompileEventList compileEventList =
          new CompileEventList(eventsModel, type: 'flagship');
          print(compileEventList
              .getEventList()
              .length);
          var provider = Provider.of<BottomNavigationBarProvider>(context);
          PageController controller =
          PageController(initialPage: provider.currentIndex);
          Provider.of<BottomNavigationBarProvider>(context, listen: true);
          provider.addListener(() {
            controller.animateToPage(provider.currentIndex,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          });
          return PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 56.0, left: 8.0, right: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Exhibitions",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      HomepageCardSpotlight(
                        eventList:
                        CompileEventList(eventsModel, type: 'exhibitions')
                            .getEventList(),
                        colorLight: Colors.orange,
                        colorDark: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Special Events",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      HomepageCardSpotlight(
                        eventList:
                        CompileEventList(eventsModel, type: 'special')
                            .getEventList(),
                        colorLight: Colors.orange,
                        colorDark: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fun Events",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      HomepageCardSpotlight(
                        eventList:
                        CompileEventList(eventsModel, type: 'funevents')
                            .getEventList(),
                        colorLight: Colors.orange,
                        colorDark: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pre-Inno-Events",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      HomepageCardSpotlight(
                        eventList:
                        CompileEventList(eventsModel, type: 'preinnoevents')
                            .getEventList(),
                        colorLight: Colors.orange,
                        colorDark: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              HomepageCard(
                eventList: CompileEventList(
                  eventsModel,
                  type: 'flagships',
                ).getEventList(),
                colorLight: ColorValues.COLOR_FLAGSHIP_LIGHT,
                colorDark: ColorValues.COLOR_FLAGSHIP_DARK,
              ),
              HomepageCard(
                eventList: CompileEventList(eventsModel, type: 'cultural')
                    .getEventList(),
                colorDark: ColorValues.COLOR_PROSHOWS_DARK,
                colorLight: ColorValues.COLOR_PROSHOWS_LIGHT,
              ),
              HomepageCard(
                eventList: CompileEventList(eventsModel,
                    type: 'workshops', type2: 'paidworkshops')
                    .getEventList(),
                colorDark: ColorValues.COLOR_WORKSHOPS_DARK,
                colorLight: ColorValues.COLOR_WORKSHOPS_LIGHT,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: EventsListView(eventsModel.result),
              ),
            ],
          );
        } else if (result.connectionState != ConnectionState.done)
          return CircularProgressIndicator();
        else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.refresh, size: 32.0, color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        _future = fetchEvent();
                      });
                    }),
                Text("We've encountered a problem",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),)
              ],
            ),
          );
        }
      },
    );
  }

  Future<Response> fetchEvent() async {
    Dio dioFetchEvents = Dio()
      ..options.baseUrl = Urls.URL_FETCH_ALL_EVENTS;
    Response response = await dioFetchEvents.get("");
    return response;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
