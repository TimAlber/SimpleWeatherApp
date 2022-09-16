// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.region,
    required this.currentConditions,
    required this.nextDays,
    required this.contactAuthor,
    required this.dataSource,
  });

  String region;
  CurrentConditions currentConditions;
  List<NextDay> nextDays;
  ContactAuthor contactAuthor;
  String dataSource;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    region: json["region"],
    currentConditions: CurrentConditions.fromJson(json["currentConditions"]),
    nextDays: List<NextDay>.from(json["next_days"].map((x) => NextDay.fromJson(x))),
    contactAuthor: ContactAuthor.fromJson(json["contact_author"]),
    dataSource: json["data_source"],
  );

  Map<String, dynamic> toJson() => {
    "region": region,
    "currentConditions": currentConditions.toJson(),
    "next_days": List<dynamic>.from(nextDays.map((x) => x.toJson())),
    "contact_author": contactAuthor.toJson(),
    "data_source": dataSource,
  };
}

class ContactAuthor {
  ContactAuthor({
    required this.email,
    required this.authNote,
  });

  String email;
  String authNote;

  factory ContactAuthor.fromJson(Map<String, dynamic> json) => ContactAuthor(
    email: json["email"],
    authNote: json["auth_note"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "auth_note": authNote,
  };
}

class CurrentConditions {
  CurrentConditions({
    required this.dayhour,
    required this.temp,
    required this.precip,
    required this.humidity,
    required this.wind,
    required this.iconUrl,
    required this.comment,
  });

  String dayhour;
  Temp temp;
  String precip;
  String humidity;
  Wind wind;
  String iconUrl;
  String comment;

  factory CurrentConditions.fromJson(Map<String, dynamic> json) => CurrentConditions(
    dayhour: json["dayhour"],
    temp: Temp.fromJson(json["temp"]),
    precip: json["precip"],
    humidity: json["humidity"],
    wind: Wind.fromJson(json["wind"]),
    iconUrl: json["iconURL"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "dayhour": dayhour,
    "temp": temp.toJson(),
    "precip": precip,
    "humidity": humidity,
    "wind": wind.toJson(),
    "iconURL": iconUrl,
    "comment": comment,
  };
}

class Temp {
  Temp({
    required this.c,
    required this.f,
  });

  int c;
  int f;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    c: json["c"],
    f: json["f"],
  );

  Map<String, dynamic> toJson() => {
    "c": c,
    "f": f,
  };
}

class Wind {
  Wind({
    required this.km,
    required this.mile,
  });

  int km;
  int mile;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    km: json["km"],
    mile: json["mile"],
  );

  Map<String, dynamic> toJson() => {
    "km": km,
    "mile": mile,
  };
}

class NextDay {
  NextDay({
    required this.day,
    required this.comment,
    required this.maxTemp,
    required this.minTemp,
    required this.iconUrl,
  });

  String day;
  String comment;
  Temp maxTemp;
  Temp minTemp;
  String iconUrl;

  factory NextDay.fromJson(Map<String, dynamic> json) => NextDay(
    day: json["day"],
    comment: json["comment"],
    maxTemp: Temp.fromJson(json["max_temp"]),
    minTemp: Temp.fromJson(json["min_temp"]),
    iconUrl: json["iconURL"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "comment": comment,
    "max_temp": maxTemp.toJson(),
    "min_temp": minTemp.toJson(),
    "iconURL": iconUrl,
  };
}
