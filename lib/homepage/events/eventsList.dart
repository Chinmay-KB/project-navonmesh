import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/urls.dart';

class EventsListView extends StatefulWidget {
  List<Result> eventsList;

  EventsListView(this.eventsList);

  @override
  _EventsListViewState createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {

  ScrollController _scrollController;
  int length;

  @override
  Widget build(BuildContext context) {
    widget.eventsList.shuffle();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          controller: _scrollController,
          itemCount: widget.eventsList.length,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.5,
            crossAxisSpacing: 8.0,),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) =>
                        Event(widget.eventsList[index].eid,
                            widget.eventsList[index].category)));
              },
              child: Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: Urls.URL_THUMBNAIL +
                        widget.eventsList[index].eid + ".jpg",
                    placeholder: (context,
                        url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageBuilder: (context, imageProvider) {
                      return
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Image(image: imageProvider),
                        );
                    },
                  ),
                  Flexible(
                    child: Container(
                      child: Text(
                        widget.eventsList[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
