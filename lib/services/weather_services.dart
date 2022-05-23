import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/weather_model.dart';

Future<WeatherData> getWeatherData() async {
  String weatherLink = 'https://goweather.herokuapp.com/weather/Pokhara';

  http.Response res = await http.get(Uri.parse(weatherLink));

  if (res.statusCode == 200) {
    return WeatherData.fromJson(
      jsonDecode(res.body),
    );
  } else {
    throw Exception('Error');
  }
}
