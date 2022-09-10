import 'dart:convert';

import 'weather_response.dart';

WeatherListResponse weatherListResponseFromJson(String str) =>
    WeatherListResponse.fromJson(json.decode(str));

String weatherListResponseToJson(WeatherListResponse data) =>
    json.encode(data.toJson());

class WeatherListResponse {
  WeatherListResponse({
    List<WeatherResponse>? weatherResponse,
  }) {
    _weatherResponse = weatherResponse;
  }

  void addWeatherResponse(WeatherResponse value) {
    _weatherResponse ??= [];
    _weatherResponse!.add(value);
  }

  WeatherListResponse.fromJson(dynamic json) {
    if (json['weatherResponse'] != null) {
      _weatherResponse = [];
      json['weatherResponse'].forEach((v) {
        _weatherResponse?.add(WeatherResponse.fromJson(v));
      });
    }
  }

  List<WeatherResponse>? _weatherResponse;

  WeatherListResponse copyWith({
    List<WeatherResponse>? weatherResponse,
  }) =>
      WeatherListResponse(
        weatherResponse: weatherResponse ?? _weatherResponse,
      );

  List<WeatherResponse> get weatherResponse => _weatherResponse ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_weatherResponse != null) {
      map['weatherResponse'] =
          _weatherResponse?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
