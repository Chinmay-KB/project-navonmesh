class PaymentResponseModel {
  double totalFare;
  String ticketId;
  String eventUrl;
  List<TicketItems> ticketItems;

  PaymentResponseModel(
      {this.totalFare, this.ticketId, this.eventUrl, this.ticketItems});

  PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    totalFare = json['totalFare'];
    ticketId = json['ticketId'];
    eventUrl = json['eventUrl'];
    if (json['ticketItems'] != null) {
      ticketItems = new List<TicketItems>();
      json['ticketItems'].forEach((v) {
        ticketItems.add(new TicketItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalFare'] = this.totalFare;
    data['ticketId'] = this.ticketId;
    data['eventUrl'] = this.eventUrl;
    if (this.ticketItems != null) {
      data['ticketItems'] = this.ticketItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketItems {
  String programName;
  String subProgramName;
  int fare;
  Attendee attendee;

  TicketItems(
      {this.programName, this.subProgramName, this.fare, this.attendee});

  TicketItems.fromJson(Map<String, dynamic> json) {
    programName = json['programName'];
    subProgramName = json['subProgramName'];
    fare = json['fare'];
    attendee = json['attendee'] != null
        ? new Attendee.fromJson(json['attendee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['programName'] = this.programName;
    data['subProgramName'] = this.subProgramName;
    data['fare'] = this.fare;
    if (this.attendee != null) {
      data['attendee'] = this.attendee.toJson();
    }
    return data;
  }
}

class Attendee {
  String name;
  String email;
  String phone;
  String college;
  String sex;
  String extraInfoValue;

  Attendee(
      {this.name,
      this.email,
      this.phone,
      this.college,
      this.sex,
      this.extraInfoValue});

  Attendee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    college = json['college'];
    sex = json['sex'];
    extraInfoValue = json['extraInfoValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['college'] = this.college;
    data['sex'] = this.sex;
    data['extraInfoValue'] = this.extraInfoValue;
    return data;
  }
}
