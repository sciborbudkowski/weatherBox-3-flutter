import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.offset,
    required this.elevation,
    required this.currently,
    required this.hourly,
    required this.daily,
    required this.flags,
  });

  double latitude;
  double longitude;
  String timezone;
  num offset;
  int elevation;
  Currently currently;
  Hourly hourly;
  Daily daily;
  Flags flags;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        offset: json["offset"],
        elevation: json["elevation"],
        currently: Currently.fromJson(json["currently"]),
        hourly: Hourly.fromJson(json["hourly"]),
        daily: Daily.fromJson(json["daily"]),
        flags: Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "offset": offset,
        "elevation": elevation,
        "currently": currently.toJson(),
        "hourly": hourly.toJson(),
        "daily": daily.toJson(),
        "flags": flags.toJson(),
      };
}

class Currently {
  Currently({
    required this.time,
    required this.summary,
    required this.icon,
    this.nearestStormDistance,
    this.nearestStormBearing,
    required this.precipIntensity,
    required this.precipProbability,
    required this.precipIntensityError,
    required this.precipType,
    required this.temperature,
    required this.apparentTemperature,
    required this.dewPoint,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windGust,
    required this.windBearing,
    required this.cloudCover,
    required this.uvIndex,
    required this.visibility,
    required this.ozone,
    this.precipAccumulation,
  });

  num time;
  Summary summary;
  Icon icon;
  int? nearestStormDistance;
  int? nearestStormBearing;
  double precipIntensity;
  double precipProbability;
  double precipIntensityError;
  PrecipType precipType;
  double temperature;
  double apparentTemperature;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  double windBearing;
  double cloudCover;
  double uvIndex;
  double visibility;
  double ozone;
  double? precipAccumulation;

  factory Currently.fromJson(Map<String, dynamic> json) => Currently(
        time: json["time"],
        summary: summaryValues.map[json["summary"]]!,
        icon: iconValues.map[json["icon"]]!,
        nearestStormDistance: json["nearestStormDistance"],
        nearestStormBearing: json["nearestStormBearing"],
        precipIntensity: json["precipIntensity"]?.toDouble(),
        precipProbability: json["precipProbability"]?.toDouble(),
        precipIntensityError: json["precipIntensityError"]?.toDouble(),
        precipType: precipTypeValues.map[json["precipType"]]!,
        temperature: json["temperature"]?.toDouble(),
        apparentTemperature: json["apparentTemperature"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windBearing: json["windBearing"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        uvIndex: json["uvIndex"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        ozone: json["ozone"]?.toDouble(),
        precipAccumulation: json["precipAccumulation"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "summary": summaryValues.reverse[summary],
        "icon": iconValues.reverse[icon],
        "nearestStormDistance": nearestStormDistance,
        "nearestStormBearing": nearestStormBearing,
        "precipIntensity": precipIntensity,
        "precipProbability": precipProbability,
        "precipIntensityError": precipIntensityError,
        "precipType": precipTypeValues.reverse[precipType],
        "temperature": temperature,
        "apparentTemperature": apparentTemperature,
        "dewPoint": dewPoint,
        "humidity": humidity,
        "pressure": pressure,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "windBearing": windBearing,
        "cloudCover": cloudCover,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "ozone": ozone,
        "precipAccumulation": precipAccumulation,
      };
}

enum Icon {
  CLOUDY,
  CLEAR_DAY,
  CLEAR_NIGHT,
  PARTLY_CLOUDY_NIGHT,
  PARTLY_CLOUDY_DAY,
  FOG,
  RAIN,
  SNOW
}

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "fog": Icon.FOG,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "rain": Icon.RAIN,
  "snow": Icon.SNOW,
});

enum PrecipType { NONE, RAIN, SNOW }

final precipTypeValues = EnumValues({
  "none": PrecipType.NONE,
  "rain": PrecipType.RAIN,
  "snow": PrecipType.SNOW
});

enum Summary { CLOUDY, CLEAR, PARTLY_CLOUDY, FOG, RAIN, SNOW }

final summaryValues = EnumValues({
  "Clear": Summary.CLEAR,
  "Cloudy": Summary.CLOUDY,
  "Fog": Summary.FOG,
  "Partly Cloudy": Summary.PARTLY_CLOUDY,
  "Rain": Summary.RAIN,
  "Snow": Summary.SNOW
});

class Daily {
  Daily({
    required this.summary,
    required this.icon,
    required this.data,
  });

  Summary summary;
  Icon icon;
  List<Datum> data;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        summary: summaryValues.map[json["summary"]]!,
        icon: iconValues.map[json["icon"]]!,
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summaryValues.reverse[summary],
        "icon": iconValues.reverse[icon],
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.time,
    required this.icon,
    required this.summary,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.moonPhase,
    required this.precipIntensity,
    required this.precipIntensityMax,
    required this.precipIntensityMaxTime,
    required this.precipProbability,
    required this.precipAccumulation,
    required this.precipType,
    required this.temperatureHigh,
    required this.temperatureHighTime,
    required this.temperatureLow,
    required this.temperatureLowTime,
    required this.apparentTemperatureHigh,
    required this.apparentTemperatureHighTime,
    required this.apparentTemperatureLow,
    required this.apparentTemperatureLowTime,
    required this.dewPoint,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windGust,
    required this.windBearing,
    required this.cloudCover,
    required this.uvIndex,
    required this.uvIndexTime,
    required this.visibility,
    required this.temperatureMin,
    required this.temperatureMinTime,
    required this.temperatureMax,
    required this.temperatureMaxTime,
    required this.apparentTemperatureMin,
    required this.apparentTemperatureMinTime,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMaxTime,
  });

  int time;
  Icon icon;
  Summary summary;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  double precipAccumulation;
  String precipType;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  double windBearing;
  double cloudCover;
  double uvIndex;
  int uvIndexTime;
  double visibility;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        time: json["time"],
        icon: iconValues.map[json["icon"]]!,
        summary: summaryValues.map[json["summary"]]!,
        sunriseTime: json["sunriseTime"],
        sunsetTime: json["sunsetTime"],
        moonPhase: json["moonPhase"]?.toDouble(),
        precipIntensity: json["precipIntensity"]?.toDouble(),
        precipIntensityMax: json["precipIntensityMax"]?.toDouble(),
        precipIntensityMaxTime: json["precipIntensityMaxTime"],
        precipProbability: json["precipProbability"]?.toDouble(),
        precipAccumulation: json["precipAccumulation"]?.toDouble(),
        precipType: json["precipType"],
        temperatureHigh: json["temperatureHigh"]?.toDouble(),
        temperatureHighTime: json["temperatureHighTime"],
        temperatureLow: json["temperatureLow"]?.toDouble(),
        temperatureLowTime: json["temperatureLowTime"],
        apparentTemperatureHigh: json["apparentTemperatureHigh"]?.toDouble(),
        apparentTemperatureHighTime: json["apparentTemperatureHighTime"],
        apparentTemperatureLow: json["apparentTemperatureLow"]?.toDouble(),
        apparentTemperatureLowTime: json["apparentTemperatureLowTime"],
        dewPoint: json["dewPoint"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windBearing: json["windBearing"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        uvIndex: json["uvIndex"]?.toDouble(),
        uvIndexTime: json["uvIndexTime"],
        visibility: json["visibility"]?.toDouble(),
        temperatureMin: json["temperatureMin"]?.toDouble(),
        temperatureMinTime: json["temperatureMinTime"],
        temperatureMax: json["temperatureMax"]?.toDouble(),
        temperatureMaxTime: json["temperatureMaxTime"],
        apparentTemperatureMin: json["apparentTemperatureMin"]?.toDouble(),
        apparentTemperatureMinTime: json["apparentTemperatureMinTime"],
        apparentTemperatureMax: json["apparentTemperatureMax"]?.toDouble(),
        apparentTemperatureMaxTime: json["apparentTemperatureMaxTime"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "icon": icon,
        "summary": summaryValues.reverse[summary],
        "sunriseTime": sunriseTime,
        "sunsetTime": sunsetTime,
        "moonPhase": moonPhase,
        "precipIntensity": precipIntensity,
        "precipIntensityMax": precipIntensityMax,
        "precipIntensityMaxTime": precipIntensityMaxTime,
        "precipProbability": precipProbability,
        "precipAccumulation": precipAccumulation,
        "precipType": precipType,
        "temperatureHigh": temperatureHigh,
        "temperatureHighTime": temperatureHighTime,
        "temperatureLow": temperatureLow,
        "temperatureLowTime": temperatureLowTime,
        "apparentTemperatureHigh": apparentTemperatureHigh,
        "apparentTemperatureHighTime": apparentTemperatureHighTime,
        "apparentTemperatureLow": apparentTemperatureLow,
        "apparentTemperatureLowTime": apparentTemperatureLowTime,
        "dewPoint": dewPoint,
        "humidity": humidity,
        "pressure": pressure,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "windBearing": windBearing,
        "cloudCover": cloudCover,
        "uvIndex": uvIndex,
        "uvIndexTime": uvIndexTime,
        "visibility": visibility,
        "temperatureMin": temperatureMin,
        "temperatureMinTime": temperatureMinTime,
        "temperatureMax": temperatureMax,
        "temperatureMaxTime": temperatureMaxTime,
        "apparentTemperatureMin": apparentTemperatureMin,
        "apparentTemperatureMinTime": apparentTemperatureMinTime,
        "apparentTemperatureMax": apparentTemperatureMax,
        "apparentTemperatureMaxTime": apparentTemperatureMaxTime,
      };
}

class Flags {
  Flags({
    required this.sources,
    required this.sourceTimes,
    required this.nearestStation,
    required this.units,
    required this.version,
  });

  List<String> sources;
  SourceTimes sourceTimes;
  int nearestStation;
  String units;
  String version;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        sources: List<String>.from(json["sources"].map((x) => x)),
        sourceTimes: SourceTimes.fromJson(json["sourceTimes"]),
        nearestStation: json["nearest-station"],
        units: json["units"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "sourceTimes": sourceTimes.toJson(),
        "nearest-station": nearestStation,
        "units": units,
        "version": version,
      };
}

class SourceTimes {
  SourceTimes({
    required this.gfs,
    required this.gefs,
  });

  DateTime gfs;
  DateTime gefs;

  factory SourceTimes.fromJson(Map<String, dynamic> json) => SourceTimes(
        gfs: DateTime.parse(json["gfs"]),
        gefs: DateTime.parse(json["gefs"]),
      );

  Map<String, dynamic> toJson() => {
        "gfs": gfs.toIso8601String(),
        "gefs": gefs.toIso8601String(),
      };
}

class Hourly {
  Hourly({
    required this.summary,
    required this.icon,
    required this.data,
  });

  Summary summary;
  Icon icon;
  List<Currently> data;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        summary: summaryValues.map[json["summary"]]!,
        icon: iconValues.map[json["icon"]]!,
        data: List<Currently>.from(
            json["data"].map((x) => Currently.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summaryValues.reverse[summary],
        "icon": iconValues.reverse[icon],
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
