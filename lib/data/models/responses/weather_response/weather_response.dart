import 'dart:convert';
import '../current_weather_response/current_weather_response.dart';
import '../forecast_response/forecast_response.dart';
import '../location_response/location_response.dart';

WeatherResponse weatherResponseFromJson(String str) =>
    WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) =>
    json.encode(data.toJson());

class WeatherResponse {
  WeatherResponse({
    String? locationLatLong,
    LocationResponse? location,
    CurrentWeatherResponse? current,
    ForecastResponse? forecast,
  }) {
    _locationLatLong = locationLatLong;
    _location = location;
    _current = current;
    _forecast = forecast;
  }

  WeatherResponse.fromJson(dynamic json) {
    _locationLatLong = json['locationLatLong'];

    _location = json['location'] != null
        ? LocationResponse.fromJson(json['location'])
        : null;
    _current = json['current'] != null
        ? CurrentWeatherResponse.fromJson(json['current'])
        : null;
    _forecast = json['forecast'] != null
        ? ForecastResponse.fromJson(json['forecast'])
        : null;
  }
  String? _locationLatLong;

  String get locationLatLong => _locationLatLong ?? "";

  set setLocationLatLong(String value) {
    _locationLatLong = value;
  }

  LocationResponse? _location;
  CurrentWeatherResponse? _current;
  ForecastResponse? _forecast;

  LocationResponse get location => _location ?? LocationResponse();

  CurrentWeatherResponse get currentWeather =>
      _current ?? CurrentWeatherResponse();

  ForecastResponse get forecast => _forecast ?? ForecastResponse();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    if (_forecast != null) {
      map['forecast'] = _forecast?.toJson();
    }
    map['locationLatLong'] = _locationLatLong;

    return map;
  }

  set setCurrentWeather(CurrentWeatherResponse value) {
    _current = value;
  }

  set setForecast(ForecastResponse value) {
    _forecast = value;
  }

  set setLocation(LocationResponse value) {
    _location = value;
  }
}
