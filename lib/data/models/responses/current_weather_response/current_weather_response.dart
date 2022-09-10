import 'dart:convert';

CurrentWeatherResponse currentWeatherResponseFromJson(String str) =>
    CurrentWeatherResponse.fromJson(json.decode(str));
String currentWeatherResponseToJson(CurrentWeatherResponse data) =>
    json.encode(data.toJson());

class CurrentWeatherResponse {
  CurrentWeatherResponse({
    int? lastUpdatedEpoch,
    String? lastUpdated,
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
    double? visKm,
    double? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
  }) {
    _lastUpdatedEpoch = lastUpdatedEpoch;
    _lastUpdated = lastUpdated;
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
    _visKm = visKm;
    _visMiles = visMiles;
    _uv = uv;
    _gustMph = gustMph;
    _gustKph = gustKph;
  }

  CurrentWeatherResponse.fromJson(dynamic json) {
    _lastUpdatedEpoch = json['last_updated_epoch'];
    _lastUpdated = json['last_updated'];
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
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _uv = json['uv'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
  }
  int? _lastUpdatedEpoch;
  String? _lastUpdated;
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
  double? _visKm;
  double? _visMiles;
  double? _uv;
  double? _gustMph;
  double? _gustKph;

  int get lastUpdatedEpoch => _lastUpdatedEpoch ?? 0;
  String get lastUpdated => _lastUpdated ?? "";
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
  double get visKm => _visKm ?? 0;
  double get visMiles => _visMiles ?? 0;
  double get uv => _uv ?? 0;
  double get gustMph => _gustMph ?? 0;
  double get gustKph => _gustKph ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = _lastUpdatedEpoch;
    map['last_updated'] = _lastUpdated;
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
    map['vis_km'] = _visKm;
    map['vis_miles'] = _visMiles;
    map['uv'] = _uv;
    map['gust_mph'] = _gustMph;
    map['gust_kph'] = _gustKph;
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
