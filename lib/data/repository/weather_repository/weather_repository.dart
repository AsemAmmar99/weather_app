
import '../../source/network/api_result_handler.dart';
import '../../source/network/my_dio.dart';

class WeatherRepository {
  Future<ApiResults> getWeatherData(String locationName) async {
    return await MyDio.getData(endPoint: "forecast.json", queryParameters: {
      "key": "0034a29a5e3e4e77a75201950231501",
      "q": locationName,
      "days": 14,
      "aqi": "no",
      "alerts": "no",
      "lang": "en",
    });
  }
}
