import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/colors.dart';

class SearchDialog extends StatefulWidget {
  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  List<Result> list, newData;
  final eventTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future _loadJson() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/events.json");
    final jsonResult = json.decode(data);
    allEventsModel eventsModel = allEventsModel.fromJson(jsonResult);
    list = eventsModel.getEvents();
    String searchText = eventTextFieldController.text;
    if (searchText.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].title.toLowerCase().contains(searchText.toLowerCase())) {
          newData.add(list[i]);
        }
      }
    } else
      newData = list;
  }

  _onChanged(String value) {
    newData.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: HomepageCardsizeApi(context).getScreenWidth() * 0.8,
        height: HomepageCardsizeApi(context).getScreenHeight() * 0.8,
        color: ColorValues.BACKGROUND_GRADIENT_3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  onChanged: _onChanged,
                  controller: eventTextFieldController,
                  cursorColor: Colors.deepPurpleAccent,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      filled: true,
                      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
                      hintText: 'Search Events',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: _loadJson(),
                  builder: (context, response) {
                    if (response.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: newData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            Event(newData[index].eid,
                                                newData[index].category)));
                              },
                              child: Card(
                                color: ColorValues.COLOR_CARD,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    newData[index].title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else
                      return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
