import 'dart:convert';

import 'package:best_flutter_ui_templates/weather/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
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
