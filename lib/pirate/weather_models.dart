import 'package:weatherbox/pirate/pirate_models.dart' as pm;

class Beaufort {
  static String getIconFor(double speed) {
    if (speed >= 0 && speed < 1) {
      return 'assets/images/wind/wind-beaufort-0.png';
    } else if (speed >= 1 && speed < 6) {
      return 'assets/images/wind/wind-beaufort-1.png';
    } else if (speed >= 6 && speed < 11) {
      return 'assets/images/wind/wind-beaufort-2.png';
    } else if (speed >= 11 && speed < 19) {
      return 'assets/images/wind/wind-beaufort-3.png';
    } else if (speed >= 19 && speed < 29) {
      return 'assets/images/wind/wind-beaufort-4.png';
    } else if (speed >= 29 && speed < 39) {
      return 'assets/images/wind/wind-beaufort-5.png';
    } else if (speed >= 39 && speed < 50) {
      return 'assets/images/wind/wind-beaufort-6.png';
    } else if (speed >= 50 && speed < 62) {
      return 'assets/images/wind/wind-beaufort-7.png';
    } else if (speed >= 62 && speed < 75) {
      return 'assets/images/wind/wind-beaufort-8.png';
    } else if (speed >= 75 && speed < 87) {
      return 'assets/images/wind/wind-beaufort-9.png';
    } else if (speed >= 87 && speed < 102) {
      return 'assets/images/wind/wind-beaufort-10.png';
    } else if (speed >= 102 && speed < 117) {
      return 'assets/images/wind/wind-beaufort-11.png';
    } else if (speed > 117) {
      return 'assets/images/wind/wind-beaufort-12.png';
    }

    return 'assets/images/wind/wind-beaufort-0.png';
  }
}

class Aqi {
  static String getIconFor(int index) {
    switch (index) {
      case 1:
        return 'assets/images/aqi/pm1.png';
      case 2:
        return 'assets/images/aqi/pm2.png';
      case 3:
        return 'assets/images/aqi/pm3.png';
      case 4:
        return 'assets/images/aqi/pm4.png';
      case 5:
        return 'assets/images/aqi/pm5.png';
      default:
        return 'assets/images/aqi/pm1.png';
    }
  }
}

class Moon {
  static String getIconFor(double phase) {
    if (phase >= 0 && phase < 0.1) {
      return 'assets/images/sun_moon/moon-new.png';
    } else if (phase >= 0.1 && phase < 0.35) {
      return 'assets/images/sun_moon/moon-waxing-crescent.png';
    } else if (phase >= 0.35 && phase < 0.45) {
      return 'assets/images/sun_moon/moon-waxing-gibbous.png';
    } else if (phase >= 0.45 && phase < 0.55) {
      return 'assets/images/sun_moon/moon-full.png';
    } else if (phase >= 0.55 && phase < 0.7) {
      return 'assets/images/sun_moon/moon-waning-gibbous.png';
    } else if (phase >= 0.7 && phase < 0.85) {
      return 'assets/images/sun_moon/moon-waning-crescent.png';
    } else if (phase >= 0.85) {
      return 'assets/images/sun_moon/moon-new.png';
    }

    return 'assets/images/sun_moon/moon-new.png';
  }
}

class UVIndex {
  static String getIconFor(int index) {
    switch (index) {
      case 0:
        return 'assets/images/uvindex/uv-index-0.png';
      case 1:
        return 'assets/images/uvindex/uv-index-1.png';
      case 2:
        return 'assets/images/uvindex/uv-index-2.png';
      case 3:
        return 'assets/images/uvindex/uv-index-3.png';
      case 4:
        return 'assets/images/uvindex/uv-index-4.png';
      case 5:
        return 'assets/images/uvindex/uv-index-5.png';
      case 6:
        return 'assets/images/uvindex/uv-index-6.png';
      case 7:
        return 'assets/images/uvindex/uv-index-7.png';
      case 8:
        return 'assets/images/uvindex/uv-index-8.png';
      case 9:
        return 'assets/images/uvindex/uv-index-9.png';
      case 10:
        return 'assets/images/uvindex/uv-index-10.png';
      default:
        return 'assets/images/uvindex/uv-index-11.png';
    }
  }
}

class Weather {
  static String getIconFor(pm.Icon icon) {
    switch (icon) {
      case pm.Icon.CLOUDY:
        return 'assets/images/weather_icons/weather_overcastClouds-day.png';
      case pm.Icon.CLEAR_DAY:
        return 'assets/images/weather_icons/weather_clearSky-day.png';
      case pm.Icon.CLEAR_NIGHT:
        return 'assets/images/weather_icons/weather_clearSky-night.png';
      case pm.Icon.PARTLY_CLOUDY_DAY:
        return 'assets/images/weather_icons/weather_brokenClouds-day.png';
      case pm.Icon.PARTLY_CLOUDY_NIGHT:
        return 'assets/images/weather_icons/weather_brokenClouds-night.png';
      case pm.Icon.FOG:
        return 'assets/images/weather_icons/weather_mist-day.png';
      case pm.Icon.RAIN:
        return 'assets/images/weather_icons/weather_rain-day.png';
      case pm.Icon.SNOW:
        return 'assets/images/weather_icons/weather_snow-day.png';
    }
  }

  static String getDescriptionPLFor(pm.Icon icon) {
    switch (icon) {
      case pm.Icon.CLOUDY:
        return 'Pochmurnie';
      case pm.Icon.CLEAR_DAY:
        return 'Pogodnie';
      case pm.Icon.CLEAR_NIGHT:
        return 'Pogodnie';
      case pm.Icon.PARTLY_CLOUDY_DAY:
        return 'Częściowe zachmurzenie';
      case pm.Icon.PARTLY_CLOUDY_NIGHT:
        return 'Częściowe zachmurzenie';
      case pm.Icon.FOG:
        return 'Mglisto';
      case pm.Icon.RAIN:
        return 'Deszczowo';
      case pm.Icon.SNOW:
        return 'Opady śniegu';
    }
  }
}

class HourlyForecastModel {
  const HourlyForecastModel(
      {required this.hour, required this.icon, required this.temperature});

  final int hour;
  final pm.Icon icon;
  final double temperature;

  String getHour() {
    DateTime current = DateTime.fromMillisecondsSinceEpoch(hour * 1000);
    var strHour = '${current.hour.toString()}:00';
    if (hour < 10) {
      strHour = '0${hour.toString()}:00';
    }

    return strHour;
  }

  String getIcon() {
    return Weather.getIconFor(icon);
  }

  String getTemperature() {
    return '${temperature.toStringAsFixed(0)} °C';
  }
}

class Season {
  static List<String> determineKeywords(int hemisphere) {
    // 0 - north, 1 - south
    DateTime dt = DateTime.now();
    List<String> winter = ['winter', 'snow'];
    List<String> spring = ['spring', 'rain', 'fresh', 'flowers'];
    List<String> summer = ['summer', 'warm', 'hot'];
    List<String> autumn = ['autumn', 'fall', 'leafs'];

    if (hemisphere == 0) {
      switch (dt.month) {
        case 12:
        case 1:
        case 2:
          return winter;
        case 3:
        case 4:
        case 5:
          return spring;
        case 6:
        case 7:
        case 8:
          return summer;
        case 9:
        case 10:
        case 11:
          return autumn;
      }
    } else {
      switch (dt.month) {
        case 12:
        case 1:
        case 2:
          return summer;
        case 3:
        case 4:
        case 5:
          return autumn;
        case 6:
        case 7:
        case 8:
          return winter;
        case 9:
        case 10:
        case 11:
          return spring;
      }
    }

    return [];
  }
}
