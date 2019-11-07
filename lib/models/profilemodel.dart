class ProfileModel {
  String status;
  Result result;

  ProfileModel({this.status, this.result});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  BasicInfo basicInfo;
  List<RegEvents> regEvents;

  Result({this.basicInfo, this.regEvents});

  Result.fromJson(Map<String, dynamic> json) {
    basicInfo = json['basicInfo'] != null
        ? new BasicInfo.fromJson(json['basicInfo'])
        : null;
    if (json['regEvents'] != null) {
      regEvents = new List<RegEvents>();
      json['regEvents'].forEach((v) {
        regEvents.add(new RegEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basicInfo != null) {
      data['basicInfo'] = this.basicInfo.toJson();
    }
    if (this.regEvents != null) {
      data['regEvents'] = this.regEvents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BasicInfo {
  String innoId;
  String name;
  String email;
  String college;
  String caId;
  String paid;
  String payment_response;
  String alloted_hostel;
  String ca_response;

  BasicInfo(
      {this.innoId, this.name, this.email, this.college, this.caId, this.paid, this.payment_response, this.ca_response, this.alloted_hostel});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    innoId = json['inno_id'];
    name = json['name'];
    email = json['email'];
    college = json['college'];
    caId = json['ca_id'];
    paid = json['paid'];
    payment_response = json['payment_response'];
    alloted_hostel = json['allotted_hostel'];
    ca_response = json['ca_response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inno_id'] = this.innoId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['college'] = this.college;
    data['ca_id'] = this.caId;
    data['paid'] = this.paid;
    data['payment_response'] = this.payment_response;
    data['allotted_hostel'] = this.alloted_hostel;
    data['ca_response'] = this.ca_response;
    return data;
  }
}

class RegEvents {
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
  String maxLimit;

  RegEvents({this.eid,
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
    this.imagePath,
    this.maxLimit});

  RegEvents.fromJson(Map<String, dynamic> json) {
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
    maxLimit = json['max_limit'];
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
    data['date1'] = this.date1;
    data['time1'] = this.time1;
    data['category'] = this.category;
    data['coordinatorName1'] = this.coordinatorName1;
    data['coordinatorContact1'] = this.coordinatorContact1;
    data['coordinatorName2'] = this.coordinatorName2;
    data['coordinatorContact2'] = this.coordinatorContact2;
    data['image_path'] = this.imagePath;
    data['max_limit'] = this.maxLimit;
    return data;
  }
}
