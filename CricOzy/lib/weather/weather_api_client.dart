import 'dart:convert';

import 'package:CriCozy/weather/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/mock_client.dart';

class WeatherApiClient {
  set httpClient(MockClient httpClient) {}

  Future<WeatherModel> getCurrentWeather(String? location) async {
    var endPoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c06ccef3f85fba1f9f98b66795ae4a7b&units=metric");
    var response = await http.get(endPoint);
    print(response.statusCode);
    var body = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(body);

    return weather;
  }
}
