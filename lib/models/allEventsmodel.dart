class allEventsModel {
  String status;
  List<Result> result;

  allEventsModel({this.status, this.result});

  allEventsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  List<Result> getEvents() => result;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String eid;
  String title;
  String description;
  String rules;
  String judgingCriteria;
  String date;
  String venue;
  String time;
  String category;
  String coordinatorName1;
  String coordinatorContact1;
  String coordinatorName2;
  String coordinatorContact2;
  String imagePath;

  Result(
      {this.eid,
      this.title,
      this.description,
      this.rules,
      this.judgingCriteria,
      this.date,
      this.venue,
      this.time,
      this.category,
      this.coordinatorName1,
      this.coordinatorContact1,
      this.coordinatorName2,
      this.coordinatorContact2,
      this.imagePath});

  Result.fromJson(Map<String, dynamic> json) {
    eid = json['eid'];
    title = json['title'];
    description = json['description'];
    rules = json['rules'];
    judgingCriteria = json['judging_criteria'];
    date = json['date'];
    venue = json['venue'];
    time = json['time'];
    category = json['category'];
    coordinatorName1 = json['coordinatorName1'];
    coordinatorContact1 = json['coordinatorContact1'];
    coordinatorName2 = json['coordinatorName2'];
    coordinatorContact2 = json['coordinatorContact2'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['description'] = this.description;
    data['rules'] = this.rules;
    data['judging_criteria'] = this.judgingCriteria;
    data['date'] = this.date;
    data['venue'] = this.venue;
    data['time'] = this.time;
    data['category'] = this.category;
    data['coordinatorName1'] = this.coordinatorName1;
    data['coordinatorContact1'] = this.coordinatorContact1;
    data['coordinatorName2'] = this.coordinatorName2;
    data['coordinatorContact2'] = this.coordinatorContact2;
    data['image_path'] = this.imagePath;
    return data;
  }
}
