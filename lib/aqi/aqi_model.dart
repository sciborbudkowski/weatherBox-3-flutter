// To parse this JSON data, do
//
//     final aqiModel = aqiModelFromJson(jsonString);

import 'dart:convert';

AqiModel aqiModelFromJson(String str) => AqiModel.fromJson(json.decode(str));

String aqiModelToJson(AqiModel data) => json.encode(data.toJson());

class AqiModel {
  AqiModel({
    required this.coord,
    required this.list,
  });

  Coord coord;
  List<ListElement> list;

  factory AqiModel.fromJson(Map<String, dynamic> json) => AqiModel(
        coord: Coord.fromJson(json["coord"]),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class ListElement {
  ListElement({
    required this.main,
    required this.components,
    required this.dt,
  });

  Main main;
  Map<String, double> components;
  int dt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        main: Main.fromJson(json["main"]),
        components: Map.from(json["components"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        dt: json["dt"],
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
        "components":
            Map.from(components).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dt": dt,
      };
}

class Main {
  Main({
    required this.aqi,
  });

  int aqi;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        aqi: json["aqi"],
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
      };
}
