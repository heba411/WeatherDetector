
import '../../domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.condition,
    required super.iconUrl,
    required super.forecast,
    required super.lastUpdated,
    required super.windSpeed,
    required super.visibility,
    required super.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["location"]["name"] ?? "Unknown",
      temperature: json["current"]["temp_c"]?.toDouble() ?? 0.0,
      condition: json["current"]["condition"]["text"] ?? "Unknown",
      iconUrl: json["current"]["condition"]["icon"] != null
          ? "https:${json["current"]["condition"]["icon"]}"
          : "",
      forecast: (json["forecast"]["forecastday"] as List?)?.map((day) {
        return ForecastDayModel.fromJson(day);
      }).toList() ?? [],
      lastUpdated: json["current"]["last_updated"],
      windSpeed: json["current"]["wind_kph"],
      visibility: json["current"]["vis_km"],
      humidity: json["current"]["humidity"],
    );
  }
}

class ForecastDayModel extends ForecastDayEntity {
  ForecastDayModel({
    required super.date,
    required super.maxTemp,
    required super.minTemp,
    required super.condition,
    required super.iconUrl,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json["date"] ?? "Unknown",
      maxTemp: json["day"]["maxtemp_c"]?.toDouble() ?? 0.0,
      minTemp: json["day"]["mintemp_c"]?.toDouble() ?? 0.0,
      condition: json["day"]["condition"]["text"] ?? "Unknown",
      iconUrl: json["day"]["condition"]["icon"] != null
          ? "https:${json["day"]["condition"]["icon"]}"
          : "",
    );
  }
}
