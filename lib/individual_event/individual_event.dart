import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_navonmesh/api/event_individual.dart';
import 'package:project_navonmesh/api/payment/event_payment.dart';
import 'package:project_navonmesh/api/registerEvent.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/imageviewer.dart';
import 'package:project_navonmesh/individual_event/companies_list.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/models/events_individual.dart' as prefix0;
import 'package:project_navonmesh/values/colors.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Event extends StatefulWidget {
  Result eventData;
  String eid;
  String category;

  Event(this.eid, this.category);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  prefix0.EventInd eventIndData;

  EventIndividualUser eventIndividualUser = new EventIndividualUser();
  RegisterEvent registerEvent = new RegisterEvent();
  String registrationStatus;
  Future<String> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = eventIndividualUser.fetchEventDetails(context, widget.eid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          FutureBuilder(
            future: _future,
            builder: (context, result) {
              if (result.hasData &&
                  result.connectionState == ConnectionState.done) {
                eventIndData =
                    prefix0.EventInd.fromJson(json.decode(result.data));
                registrationStatus = eventIndData.registerStatus == 1
                    ? "Deregister"
                    : "Register";
                return Stack(children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 8.0, right: 8.0, bottom: 8.0),
                          child: Text(
                            eventIndData.result.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0,
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 8.0),
                                    child: Card(
                                      child: CachedNetworkImage(
                                        imageUrl: Urls.DOMAIN +
                                            "/" +
                                            eventIndData.result.imagePath,
                                        placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                        imageBuilder: (context, imageProvider) {
                                          return ClipRRect(
                                            borderRadius:
                                            new BorderRadius.circular(8.0),
                                            child: Image(
                                              image: imageProvider,
                                              height:
                                              HomepageCardsizeApi(context)
                                                  .getCardWidth(),
                                            ),
                                          );
                                        },
                                      ),
                                      elevation: 5.0,
                                      color: Colors.transparent,
                                    )),
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              ImageViewer(Urls
                                                  .DOMAIN +
                                                  "/" +
                                                  eventIndData.result
                                                      .imagePath)));
                                },
                              ),
                              Column(
                                children: <Widget>[
                                  detailsButton(Icons.calendar_today,
                                      eventIndData.result.date, context),
                                  detailsButton(Icons.access_time,
                                      eventIndData.result.time, context),
                                  detailsButton(Icons.location_on,
                                      eventIndData.result.venue, context),
                                  widget.category.toLowerCase() ==
                                      "paidworkshops"
                                      ? RaisedButton(
                                      onPressed: () {
                                        print(eventIndData.result.eid);
                                        print(eventIndData.result.title);
                                        EventPayment().getResponse(
                                            context, eventIndData.result.eid,
                                            eventIndData.result.title);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Payment',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      elevation: 7.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0)),
                                      color: ColorValues.COLOR_BUTTON_LOGIN)
                                      : eventIndData.result.eid=="105"?RaisedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => CompaniesList(eventIndData.registerStatus == 0?false:true)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Companies',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      elevation: 7.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0)),
                                      color: ColorValues.COLOR_BUTTON_LOGIN):Container(),


                                ],
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                        detailsCard(
                            "Description", eventIndData.result.description),
                        detailsCard("Rules", eventIndData.result.rules),
                        detailsCard("Judging Criteria",
                            eventIndData.result.judgingCriteria),
                        callButton(eventIndData, context),
                        Container(
                          height: 50.0,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Align(
                        alignment: Alignment(1, 1.02),
                        child: ButtonTheme(
                          minWidth: HomepageCardsizeApi(context).screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                  child: Text(
                                    eventIndData.registerStatus == 0
                                        ? "Register"
                                        : "Deregister",
                                    style: TextStyle(
                                        color: ColorValues.COLOR_FLAGSHIP_DARK,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0),
                                  ),
                                  disabledColor:
                                  ColorValues.COLOR_ICON_FLAGSHIP,
                                  onPressed: null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.only(
                                          topRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(16.0)))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (eventIndData.result.eid != "105") {
                        regEventCall(context, eventIndData.result.eid);
                      } else {
                        if (eventIndData.registerStatus == 1)
                          regEventCall(context, eventIndData.result.eid);
                        else
                          Navigator.popAndPushNamed(context,
                              '/internmela_form');
                      }

                    },
                  ),
                ]);
              } else if (result.connectionState != ConnectionState.done)
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.refresh,
                            size: 32.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _future = eventIndividualUser.fetchEventDetails(
                                  context, widget.eid);
                            });
                          }),
                      Text(
                        "We've encountered a problem",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  regEventCall(BuildContext context, String eid) async {
    registerEvent.regEvent(context, eventIndData.result.eid);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _future = eventIndividualUser.fetchEventDetails(context, widget.eid);
      });
    });
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
              padding:
              const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                child: Html(
                  data: details,
                  onLinkTap: (url) {
                    UrlLauncher.launch(url);
                  },
                ),
              ))),
    );
  }

  Widget detailsButton(IconData icons, String details, BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                icons,
                color: ColorValues.COLOR_FLAGSHIP_LIGHT,
                size: cardsizeApi.getCardIconSize() + 4,
              ),
            ),
            Container(
                width: cardsizeApi.getScreenWidth() / 4.5,
                child: Text(
                  details,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: cardsizeApi.getCardDetailsSize() + 4),
                ))
          ],
        ),
      ),
    );
  }

  Widget callButton(prefix0.EventInd result, BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Coordinators",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => UrlLauncher.launch(
                      "tel:${result.result.coordinatorContact1}"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.call,
                          color: ColorValues.COLOR_FLAGSHIP_LIGHT,
                          size: cardsizeApi.getCardIconSize() + 4,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            result.result.coordinatorName1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: cardsizeApi.getCardDetailsSize() + 4),
                          ),
                          Text(
                            result.result.coordinatorContact1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: cardsizeApi.getCardDetailsSize() + 4),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                  child: result.result.coordinatorContact2.isNotEmpty ?
                  GestureDetector(
                    onTap: () =>
                        UrlLauncher.launch(
                            "tel:${result.result.coordinatorContact2
                                .toString()}"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.call,
                            color: ColorValues.COLOR_FLAGSHIP_LIGHT,
                            size: cardsizeApi.getCardIconSize() + 4,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              result.result.coordinatorName2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cardsizeApi.getCardDetailsSize() +
                                      4),
                            ),
                            Text(
                              result.result.coordinatorContact2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cardsizeApi.getCardDetailsSize() +
                                      4),
                            )
                          ],
                        )
                      ],
                    ),
                  ) : Container(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
