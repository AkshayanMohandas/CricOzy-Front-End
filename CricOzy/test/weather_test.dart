import 'dart:convert';

import 'package:best_flutter_ui_templates/weather/weather_api_client.dart';
import 'package:best_flutter_ui_templates/weather/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('WeatherApiClient', () {
    late WeatherApiClient weatherApiClient;

    setUp(() {
      weatherApiClient = WeatherApiClient();
    });

    test('should return a WeatherModel when location is valid', () async {
      // Arrange
      final responseBody = {
        'coord': {'lon': -80.1937, 'lat': 25.7743},
        'weather': [
          {
            'id': 800,
            'main': 'Clear',
            'description': 'clear sky',
            'icon': '01d'
          }
        ],
        'main': {
          'temp': 27.55,
          'feels_like': 27.55,
          'temp_min': 26.11,
          'temp_max': 29.44,
          'pressure': 1015,
          'humidity': 78
        },
        'wind': {'speed': 3.6, 'deg': 350},
        'name': 'Miami',
        'sys': {'country': 'US'}
      };
      final response = http.Response(jsonEncode(responseBody), 200);

      // Use `MockClient` to mock HTTP requests/responses.
      weatherApiClient.httpClient = MockClient((request) async {
        expect(request.url.toString(),
            'https://api.openweathermap.org/data/2.5/weather?q=Miami&appid=c06ccef3f85fba1f9f98b66795ae4a7b&units=metric');
        return response;
      });

      // Act
      final result = await weatherApiClient.getCurrentWeather('Miami');

      // Assert
      expect(result, WeatherModel.fromJson(responseBody));
    });

    test('should throw an exception when location is invalid', () async {
      // Arrange
      final response = http.Response('Not Found', 404);

      // Use `MockClient` to mock HTTP requests/responses.
      weatherApiClient.httpClient = MockClient((request) async {
        expect(request.url.toString(),
            'https://api.openweathermap.org/data/2.5/weather?q=InvalidLocation&appid=c06ccef3f85fba1f9f98b66795ae4a7b&units=metric');
        return response;
      });

      // Act and assert
      expect(
          () async =>
              await weatherApiClient.getCurrentWeather('InvalidLocation'),
          throwsA(isInstanceOf<Exception>()));
    });
  });
}
