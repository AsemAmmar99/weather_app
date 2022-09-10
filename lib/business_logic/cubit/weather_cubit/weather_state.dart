part of 'weather_cubit.dart';

@immutable
abstract class WeatherStates {}

class WeatherInitial extends WeatherStates {}

class GetWeatherDataLoadingState extends WeatherStates {}

class GetWeatherDataSuccessState extends WeatherStates {
  final WeatherResponse newWeatherResponse;

  GetWeatherDataSuccessState(this.newWeatherResponse);
}

class GetWeatherDataErrorState extends WeatherStates {}

class GetTempWeatherDataLoadingState extends WeatherStates {}

class GetTempWeatherDataSuccessState extends WeatherStates {}

class GetTempWeatherDataErrorState extends WeatherStates {}

class GetAllWeatherDataSuccessState extends WeatherStates {}

class GetOtherWeatherDataSuccessState extends WeatherStates {}

class GetFavoriteWeatherDataSuccessState extends WeatherStates {}

class RemoveWeatherDataSuccessState extends WeatherStates {}

class RemoveWeatherDataErrorState extends WeatherStates {}

class ChangeFavoriteState extends WeatherStates {}
