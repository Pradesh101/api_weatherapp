class WeatherData {
  WeatherData({
    required this.temperature,
    this.wind,
    this.description,
    this.forecast,
  });

  String temperature;
  String? wind;
  String? description;
  List<Forecast>? forecast;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      WeatherData(
        temperature: json["temperature"],
        wind: json["wind"],
        description: json["description"],
        forecast: List<Forecast>.from(
            json["forecast"].map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "wind": wind,
        "description": description,
        "forecast": List<dynamic>.from(forecast!.map((x) => x.toJson())),
      };
}

class Forecast {
  Forecast({
    this.day,
    this.temperature,
    this.wind,
  });

  String? day;
  String? temperature;
  String? wind;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        temperature: json["temperature"],
        wind: json["wind"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "temperature": temperature,
        "wind": wind,
      };
}
