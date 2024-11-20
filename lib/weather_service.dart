import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '5646e22f2cd7bde1f805de5b3292bd96'; // Replace with your OpenWeatherMap API key

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}