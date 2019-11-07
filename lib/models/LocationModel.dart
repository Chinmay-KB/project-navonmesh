class venueModel {
  List<Venues> venues;

  venueModel({this.venues});

  venueModel.fromJson(Map<String, dynamic> json) {
    if (json['venues'] != null) {
      venues = new List<Venues>();
      json['venues'].forEach((v) {
        venues.add(new Venues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.venues != null) {
      data['venues'] = this.venues.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Venues {
  String venue;
  String mapsUrl;

  Venues({this.venue, this.mapsUrl});

  Venues.fromJson(Map<String, dynamic> json) {
    venue = json['venue'];
    mapsUrl = json['maps_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venue'] = this.venue;
    data['maps_url'] = this.mapsUrl;
    return data;
  }
}
