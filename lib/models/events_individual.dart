class EventInd {
  String status;
  Result result;
  int registerStatus;

  EventInd({this.status, this.result, this.registerStatus});

  EventInd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    registerStatus = json['register_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['register_status'] = this.registerStatus;
    return data;
  }
}

class Result {
  String s0;
  String s1;
  String s2;
  String s3;
  String s4;
  String s5;
  String s6;
  String s7;
  String s8;
  String s9;
  String s10;
  String s11;
  String s12;
  String s13;
  String s14;
  String s15;
  String eid;
  String title;
  String description;
  String rules;
  String judgingCriteria;
  String date;
  String venue;
  String time;
  String date1;
  String time1;
  String category;
  String coordinatorName1;
  String coordinatorContact1;
  String coordinatorName2;
  String coordinatorContact2;
  String imagePath;

  Result(
      {this.s0,
      this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      this.s10,
      this.s11,
      this.s12,
      this.s13,
      this.s14,
      this.s15,
      this.eid,
      this.title,
      this.description,
      this.rules,
      this.judgingCriteria,
      this.date,
      this.venue,
      this.time,
      this.date1,
      this.time1,
      this.category,
      this.coordinatorName1,
      this.coordinatorContact1,
      this.coordinatorName2,
      this.coordinatorContact2,
      this.imagePath});

  Result.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    eid = json['eid'];
    title = json['title'];
    description = json['description'];
    rules = json['rules'];
    judgingCriteria = json['judging_criteria'];
    date = json['date'];
    venue = json['venue'];
    time = json['time'];
    date1 = json['date1'];
    time1 = json['time1'];
    category = json['category'];
    coordinatorName1 = json['coordinatorName1'];
    coordinatorContact1 = json['coordinatorContact1'];
    coordinatorName2 = json['coordinatorName2'];
    coordinatorContact2 = json['coordinatorContact2'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['description'] = this.description;
    data['rules'] = this.rules;
    data['judging_criteria'] = this.judgingCriteria;
    data['date'] = this.date;
    data['venue'] = this.venue;
    data['time'] = this.time;
    data['date1'] = this.date1;
    data['time1'] = this.time1;
    data['category'] = this.category;
    data['coordinatorName1'] = this.coordinatorName1;
    data['coordinatorContact1'] = this.coordinatorContact1;
    data['coordinatorName2'] = this.coordinatorName2;
    data['coordinatorContact2'] = this.coordinatorContact2;
    data['image_path'] = this.imagePath;
    return data;
  }
}
