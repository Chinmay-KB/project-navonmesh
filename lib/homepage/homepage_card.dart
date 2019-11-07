import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/urls.dart';

class HomepageCard extends StatelessWidget {
  var cardWidthFactor = 0.85;
  var cardHeightFactor = 0.75;
  var cardTitleScaleFactor = 0.03;
  List<Result> eventList;
  Color colorDark, colorLight;

  HomepageCard({this.colorDark, this.colorLight, this.eventList});

  @override
  Widget build(BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return PageView.builder(
        controller: PageController(
          viewportFraction: 0.8,
        ),
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) =>
                      Event(eventList[index].eid, eventList[index].category)));
            },
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0, -0.8),
                  child: CachedNetworkImage(
                    imageUrl: Urls.URL_THUMBNAIL + eventList[index].eid +
                        ".jpg",
                    placeholder: (context,
                        url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageBuilder: (context, imageProvider) {
                      return
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: prefix0.Image(image: imageProvider,
                            width: cardsizeApi.getCardWidth(),),
                        );
                    },

                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          eventList[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: cardsizeApi.getCardTitleSize(),
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            detailsButton(
                                Icons.date_range,
                                "Nov " + eventList[index].date.substring(1, 2),
                                context),
                            detailsButton(
                                Icons.access_time, eventList[index].time,
                                context),
                            detailsButton(
                                Icons.location_on, eventList[index].venue,
                                context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget detailsButton(IconData icons, String details, BuildContext context) {
    var cardsizeApi = HomepageCardsizeApi(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
            width: cardsizeApi.getCardButtonBoxSize() / 1.5,
            child: Text(
              details,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: cardsizeApi.getCardDetailsSize()),
            ))
      ],
    );
  }


}
