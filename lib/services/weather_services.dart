import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherServices {
  final String apiKey = dotenv.env['OPEN_WEATHER_API_KEY']!;

  Future<Weather> fetchWeather(String cityName) async{
  
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey'));
   
    if(response.statusCode == 200){
      print('Response: ${response.body}');
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }


    
  }
}




