import 'dart:convert';

import 'package:aplikasi_cuaca/weather.dart';
import 'package:http/http.dart' as http;

class DataService{

  Future<Weather> fecthData(String cityName) async{
    try {
      //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
      final queryParameters = {
      'q' : cityName,
      'appid' : '6b45b231912a4255e32dcee19d52921d',
      'units' : 'imperial'
  };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);  
    final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else{
        throw Exception('Failed to load weather');
      }

    } catch (e) {
      rethrow;
    }  
  }
}
