import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/urls.dart';

class HomepageCardSpotlight extends StatelessWidget {
  var cardWidthFactor = 0.85;
  var cardHeightFactor = 0.75;
  var cardTitleScaleFactor = 0.03;
  List<Result> eventList;
  Color colorDark, colorLight;

  HomepageCardSpotlight({this.colorDark, this.colorLight, this.eventList});

  @override
  Widget build(BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Container(
      width: cardsizeApi.getScreenWidth(),
      height: cardsizeApi.getCardHeight() / 2.8,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: eventList.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) =>
                        Event(
                            eventList[index].eid, eventList[index].category))),
                child: Card(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          Urls.URL_THUMBNAIL + eventList[index].eid + ".jpg",
                          placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          new Icon(Icons.error, color: Colors.white,),
                          imageBuilder: (context, imageProvider) {
                            return ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: prefix0.Image(
                                image: imageProvider,
                                width: cardsizeApi.getCardWidth() / 3,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: cardsizeApi.getCardWidth() / 1.5,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  eventList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: cardsizeApi.getCardTitleSize(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    detailsButton(
                                        Icons.date_range,
                                        fetchMonth(eventList[index].date) +
                                            " " + eventList[index]
                                            .date
                                            .substring(0, 2),
                                        context),
                                    detailsButton(Icons.access_time,
                                        eventList[index].time, context),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: detailsButtonSp(Icons.location_on,
                                      eventList[index].venue, context),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget detailsButton(IconData icons, String details, BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            icons,
            color: colorLight,
            size: cardsizeApi.getCardIconSize(),
          ),
        ),
        Container(
            width: cardsizeApi.getCardButtonBoxSize() / 2.5,
            child: Text(
              details,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: cardsizeApi.getCardDetailsSize()),
            ))
      ],
    );
  }

  Widget detailsButtonSp(IconData icons, String details, BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            icons,
            color: colorLight,
            size: cardsizeApi.getCardIconSize(),
          ),
        ),
        Text(
          details,
          style: TextStyle(
              color: Colors.white, fontSize: cardsizeApi.getCardDetailsSize()),
        )
      ],
    );
  }

  String fetchMonth(String date) {
    String month = date.substring(3, 5);
    if (month.compareTo("10") == 0) {
      return "Oct";
    }
    else
      return "Nov";
  }
}
