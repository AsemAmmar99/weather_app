import 'dart:convert';

ForecastResponse forecastResponseFromJson(String str) =>
    ForecastResponse.fromJson(json.decode(str));
String forecastResponseToJson(ForecastResponse data) =>
    json.encode(data.toJson());

class ForecastResponse {
  ForecastResponse({
    List<Forecastday>? forecastday,
  }) {
    _forecastday = forecastday;
  }

  ForecastResponse.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      _forecastday = [];
      json['forecastday'].forEach((v) {
        _forecastday?.add(Forecastday.fromJson(v));
      });
    }
  }
  List<Forecastday>? _forecastday;

  List<Forecastday> get forecastday => _forecastday ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_forecastday != null) {
      map['forecastday'] = _forecastday?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Forecastday forecastdayFromJson(String str) =>
    Forecastday.fromJson(json.decode(str));
String forecastdayToJson(Forecastday data) => json.encode(data.toJson());

class Forecastday {
  Forecastday({
    String? date,
    int? dateEpoch,
    Day? day,
    Astro? astro,
    List<Hour>? hour,
  }) {
    _date = date;
    _dateEpoch = dateEpoch;
    _day = day;
    _astro = astro;
    _hour = hour;
  }

  Forecastday.fromJson(dynamic json) {
    _date = json['date'];
    _dateEpoch = json['date_epoch'];
    _day = json['day'] != null ? Day.fromJson(json['day']) : null;
    _astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      _hour = [];
      json['hour'].forEach((v) {
        _hour?.add(Hour.fromJson(v));
      });
    }
  }
  String? _date;
  int? _dateEpoch;
  Day? _day;
  Astro? _astro;
  List<Hour>? _hour;

  String get date => _date ?? "";
  int get dateEpoch => _dateEpoch ?? 0;
  Day get day => _day ?? Day();
  Astro get astro => _astro ?? Astro();
  List<Hour> get hour => _hour ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['date_epoch'] = _dateEpoch;
    if (_day != null) {
      map['day'] = _day?.toJson();
    }
    if (_astro != null) {
      map['astro'] = _astro?.toJson();
    }
    if (_hour != null) {
      map['hour'] = _hour?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Hour hourFromJson(String str) => Hour.fromJson(json.decode(str));
String hourToJson(Hour data) => json.encode(data.toJson());

class Hour {
  Hour({
    int? timeEpoch,
    String? time,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    double? visKm,
    double? visMiles,
    double? gustMph,
    double? gustKph,
    double? uv,
  }) {
    _timeEpoch = timeEpoch;
    _time = time;
    _tempC = tempC;
    _tempF = tempF;
    _isDay = isDay;
    _condition = condition;
    _windMph = windMph;
    _windKph = windKph;
    _windDegree = windDegree;
    _windDir = windDir;
    _pressureMb = pressureMb;
    _pressureIn = pressureIn;
    _precipMm = precipMm;
    _precipIn = precipIn;
    _humidity = humidity;
    _cloud = cloud;
    _feelslikeC = feelslikeC;
    _feelslikeF = feelslikeF;
    _windchillC = windchillC;
    _windchillF = windchillF;
    _heatindexC = heatindexC;
    _heatindexF = heatindexF;
    _dewpointC = dewpointC;
    _dewpointF = dewpointF;
    _willItRain = willItRain;
    _chanceOfRain = chanceOfRain;
    _willItSnow = willItSnow;
    _chanceOfSnow = chanceOfSnow;
    _visKm = visKm;
    _visMiles = visMiles;
    _gustMph = gustMph;
    _gustKph = gustKph;
    _uv = uv;
  }

  Hour.fromJson(dynamic json) {
    _timeEpoch = json['time_epoch'];
    _time = json['time'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _windchillC = json['windchill_c'];
    _windchillF = json['windchill_f'];
    _heatindexC = json['heatindex_c'];
    _heatindexF = json['heatindex_f'];
    _dewpointC = json['dewpoint_c'];
    _dewpointF = json['dewpoint_f'];
    _willItRain = json['will_it_rain'];
    _chanceOfRain = json['chance_of_rain'];
    _willItSnow = json['will_it_snow'];
    _chanceOfSnow = json['chance_of_snow'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
    _uv = json['uv'];
  }
  int? _timeEpoch;
  String? _time;
  double? _tempC;
  double? _tempF;
  int? _isDay;
  Condition? _condition;
  double? _windMph;
  double? _windKph;
  int? _windDegree;
  String? _windDir;
  double? _pressureMb;
  double? _pressureIn;
  double? _precipMm;
  double? _precipIn;
  int? _humidity;
  int? _cloud;
  double? _feelslikeC;
  double? _feelslikeF;
  double? _windchillC;
  double? _windchillF;
  double? _heatindexC;
  double? _heatindexF;
  double? _dewpointC;
  double? _dewpointF;
  int? _willItRain;
  int? _chanceOfRain;
  int? _willItSnow;
  int? _chanceOfSnow;
  double? _visKm;
  double? _visMiles;
  double? _gustMph;
  double? _gustKph;
  double? _uv;

  int get timeEpoch => _timeEpoch ?? 0;
  String get time => _time ?? "";
  double get tempC => _tempC ?? 0;
  double get tempF => _tempF ?? 0;
  int get isDay => _isDay ?? 0;
  Condition get condition => _condition ?? Condition();
  double get windMph => _windMph ?? 0;
  double get windKph => _windKph ?? 0;
  int get windDegree => _windDegree ?? 0;
  String get windDir => _windDir ?? "";
  double get pressureMb => _pressureMb ?? 0;
  double get pressureIn => _pressureIn ?? 0;
  double get precipMm => _precipMm ?? 0;
  double get precipIn => _precipIn ?? 0;
  int get humidity => _humidity ?? 0;
  int get cloud => _cloud ?? 0;
  double get feelslikeC => _feelslikeC ?? 0;
  double get feelslikeF => _feelslikeF ?? 0;
  double get windchillC => _windchillC ?? 0;
  double get windchillF => _windchillF ?? 0;
  double get heatindexC => _heatindexC ?? 0;
  double get heatindexF => _heatindexF ?? 0;
  double get dewpointC => _dewpointC ?? 0;
  double get dewpointF => _dewpointF ?? 0;
  int get willItRain => _willItRain ?? 0;
  int get chanceOfRain => _chanceOfRain ?? 0;
  int get willItSnow => _willItSnow ?? 0;
  int get chanceOfSnow => _chanceOfSnow ?? 0;
  double get visKm => _visKm ?? 0;
  double get visMiles => _visMiles ?? 0;
  double get gustMph => _gustMph ?? 0;
  double get gustKph => _gustKph ?? 0;
  double get uv => _uv ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time_epoch'] = _timeEpoch;
    map['time'] = _time;
    map['temp_c'] = _tempC;
    map['temp_f'] = _tempF;
    map['is_day'] = _isDay;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['wind_mph'] = _windMph;
    map['wind_kph'] = _windKph;
    map['wind_degree'] = _windDegree;
    map['wind_dir'] = _windDir;
    map['pressure_mb'] = _pressureMb;
    map['pressure_in'] = _pressureIn;
    map['precip_mm'] = _precipMm;
    map['precip_in'] = _precipIn;
    map['humidity'] = _humidity;
    map['cloud'] = _cloud;
    map['feelslike_c'] = _feelslikeC;
    map['feelslike_f'] = _feelslikeF;
    map['windchill_c'] = _windchillC;
    map['windchill_f'] = _windchillF;
    map['heatindex_c'] = _heatindexC;
    map['heatindex_f'] = _heatindexF;
    map['dewpoint_c'] = _dewpointC;
    map['dewpoint_f'] = _dewpointF;
    map['will_it_rain'] = _willItRain;
    map['chance_of_rain'] = _chanceOfRain;
    map['will_it_snow'] = _willItSnow;
    map['chance_of_snow'] = _chanceOfSnow;
    map['vis_km'] = _visKm;
    map['vis_miles'] = _visMiles;
    map['gust_mph'] = _gustMph;
    map['gust_kph'] = _gustKph;
    map['uv'] = _uv;
    return map;
  }
}

Condition conditionFromJson(String str) => Condition.fromJson(json.decode(str));
String conditionToJson(Condition data) => json.encode(data.toJson());

class Condition {
  Condition({
    String? text,
    String? icon,
    int? code,
  }) {
    _text = text;
    _icon = icon;
    _code = code;
  }

  Condition.fromJson(dynamic json) {
    _text = json['text'];
    _icon = json['icon'];
    _code = json['code'];
  }
  String? _text;
  String? _icon;
  int? _code;

  String get text => _text ?? "";
  String get icon => _icon ?? "";
  int get code => _code ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['icon'] = _icon;
    map['code'] = _code;
    return map;
  }
}

Astro astroFromJson(String str) => Astro.fromJson(json.decode(str));
String astroToJson(Astro data) => json.encode(data.toJson());

class Astro {
  Astro({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    String? moonIllumination,
  }) {
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _moonIllumination = moonIllumination;
  }

  Astro.fromJson(dynamic json) {
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _moonIllumination = json['moon_illumination'];
  }
  String? _sunrise;
  String? _sunset;
  String? _moonrise;
  String? _moonset;
  String? _moonPhase;
  String? _moonIllumination;

  String? get sunrise => _sunrise;
  String? get sunset => _sunset;
  String? get moonrise => _moonrise;
  String? get moonset => _moonset;
  String? get moonPhase => _moonPhase;
  String? get moonIllumination => _moonIllumination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    map['moon_illumination'] = _moonIllumination;
    return map;
  }
}

Day dayFromJson(String str) => Day.fromJson(json.decode(str));
String dayToJson(Day data) => json.encode(data.toJson());

class Day {
  Day({
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    double? avgvisKm,
    double? avgvisMiles,
    double? avghumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    Condition? condition,
    double? uv,
  }) {
    _maxtempC = maxtempC;
    _maxtempF = maxtempF;
    _mintempC = mintempC;
    _mintempF = mintempF;
    _avgtempC = avgtempC;
    _avgtempF = avgtempF;
    _maxwindMph = maxwindMph;
    _maxwindKph = maxwindKph;
    _totalprecipMm = totalprecipMm;
    _totalprecipIn = totalprecipIn;
    _avgvisKm = avgvisKm;
    _avgvisMiles = avgvisMiles;
    _avghumidity = avghumidity;
    _dailyWillItRain = dailyWillItRain;
    _dailyChanceOfRain = dailyChanceOfRain;
    _dailyWillItSnow = dailyWillItSnow;
    _dailyChanceOfSnow = dailyChanceOfSnow;
    _condition = condition;
    _uv = uv;
  }

  Day.fromJson(dynamic json) {
    _maxtempC = json['maxtemp_c'];
    _maxtempF = json['maxtemp_f'];
    _mintempC = json['mintemp_c'];
    _mintempF = json['mintemp_f'];
    _avgtempC = json['avgtemp_c'];
    _avgtempF = json['avgtemp_f'];
    _maxwindMph = json['maxwind_mph'];
    _maxwindKph = json['maxwind_kph'];
    _totalprecipMm = json['totalprecip_mm'];
    _totalprecipIn = json['totalprecip_in'];
    _avgvisKm = json['avgvis_km'];
    _avgvisMiles = json['avgvis_miles'];
    _avghumidity = json['avghumidity'];
    _dailyWillItRain = json['daily_will_it_rain'];
    _dailyChanceOfRain = json['daily_chance_of_rain'];
    _dailyWillItSnow = json['daily_will_it_snow'];
    _dailyChanceOfSnow = json['daily_chance_of_snow'];
    _condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    _uv = json['uv'];
  }
  double? _maxtempC;
  double? _maxtempF;
  double? _mintempC;
  double? _mintempF;
  double? _avgtempC;
  double? _avgtempF;
  double? _maxwindMph;
  double? _maxwindKph;
  double? _totalprecipMm;
  double? _totalprecipIn;
  double? _avgvisKm;
  double? _avgvisMiles;
  double? _avghumidity;
  int? _dailyWillItRain;
  int? _dailyChanceOfRain;
  int? _dailyWillItSnow;
  int? _dailyChanceOfSnow;
  Condition? _condition;
  double? _uv;

  double get maxtempC => _maxtempC ?? 0;
  double get maxtempF => _maxtempF ?? 0;
  double get mintempC => _mintempC ?? 0;
  double get mintempF => _mintempF ?? 0;
  double get avgtempC => _avgtempC ?? 0;
  double get avgtempF => _avgtempF ?? 0;
  double get maxwindMph => _maxwindMph ?? 0;
  double get maxwindKph => _maxwindKph ?? 0;
  double get totalprecipMm => _totalprecipMm ?? 0;
  double get totalprecipIn => _totalprecipIn ?? 0;
  double get avgvisKm => _avgvisKm ?? 0;
  double get avgvisMiles => _avgvisMiles ?? 0;
  double get avghumidity => _avghumidity ?? 0;
  int get dailyWillItRain => _dailyWillItRain ?? 0;
  int get dailyChanceOfRain => _dailyChanceOfRain ?? 0;
  int get dailyWillItSnow => _dailyWillItSnow ?? 0;
  int get dailyChanceOfSnow => _dailyChanceOfSnow ?? 0;
  Condition get condition => _condition ?? Condition();
  double get uv => _uv ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = _maxtempC;
    map['maxtemp_f'] = _maxtempF;
    map['mintemp_c'] = _mintempC;
    map['mintemp_f'] = _mintempF;
    map['avgtemp_c'] = _avgtempC;
    map['avgtemp_f'] = _avgtempF;
    map['maxwind_mph'] = _maxwindMph;
    map['maxwind_kph'] = _maxwindKph;
    map['totalprecip_mm'] = _totalprecipMm;
    map['totalprecip_in'] = _totalprecipIn;
    map['avgvis_km'] = _avgvisKm;
    map['avgvis_miles'] = _avgvisMiles;
    map['avghumidity'] = _avghumidity;
    map['daily_will_it_rain'] = _dailyWillItRain;
    map['daily_chance_of_rain'] = _dailyChanceOfRain;
    map['daily_will_it_snow'] = _dailyWillItSnow;
    map['daily_chance_of_snow'] = _dailyChanceOfSnow;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['uv'] = _uv;
    return map;
  }
}
