
import '../../source/network/api_result_handler.dart';
import '../../source/network/my_dio.dart';

class WeatherRepository {
  Future<ApiResults> getWeatherData(String locationName) async {
    return await MyDio.getData(endPoint: "forecast.json", queryParameters: {
      "key": "860b3e96ae5d47c9ad9183114220609",
      "q": locationName,
      "days": 14,
      "aqi": "no",
      "alerts": "no",
      "lang": "en",
    });
  }
}
