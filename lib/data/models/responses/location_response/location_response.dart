import 'dart:convert';

LocationResponse locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));
String locationResponseToJson(LocationResponse data) =>
    json.encode(data.toJson());

class LocationResponse {
  LocationResponse({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
    bool? favorite,
  }) {
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _tzId = tzId;
    _localtimeEpoch = localtimeEpoch;
    _localtime = localtime;
    _favorite = favorite;
  }

  LocationResponse.fromJson(dynamic json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
    _favorite = json['favorite'];
  }
  String? _name;
  String? _region;
  String? _country;
  double? _lat;
  double? _lon;
  String? _tzId;
  int? _localtimeEpoch;
  String? _localtime;
  bool? _favorite;

  String get name => _name ?? "";
  String get region => _region ?? "";
  String get country => _country ?? "";
  double get lat => _lat ?? 0;
  double get lon => _lon ?? 0;
  String get tzId => _tzId ?? "";
  int get localtimeEpoch => _localtimeEpoch ?? 0;
  String get localtime => _localtime ?? "";
  bool get favorite => _favorite ?? false;

  set setFavorite(bool value) {
    _favorite = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['tz_id'] = _tzId;
    map['localtime_epoch'] = _localtimeEpoch;
    map['localtime'] = _localtime;
    map['favorite'] = _favorite;
    return map;
  }
}
