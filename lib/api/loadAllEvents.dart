import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:project_navonmesh/models/allEventsmodel.dart';
import 'package:project_navonmesh/values/urls.dart';

class CompileEventList{
  allEventsModel eventList;
  String type;
  String type2;

  CompileEventList(this.eventList,{this.type,this.type2});

  List<Result> getEventList(){
    List<Result> parseEvent=new List();
    for(int i=0;i<eventList.result.length;i++){
      if(eventList.result[i].category.toLowerCase().compareTo(type)==0)
      {
        parseEvent.add(eventList.result[i]);
      }
      else if(type2!=null)
        if(eventList.result[i].category.toLowerCase().compareTo(type2)==0)
          parseEvent.add(eventList.result[i]);

    }
    return parseEvent;

  }

}
