class WeatherEntity {
  final String cityName;
  final double temperature;
  final String condition;
  final String iconUrl;
  final String lastUpdated;
  final int humidity;
  final double windSpeed;
  final double visibility;
  final List<ForecastDayEntity> forecast;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.forecast,
    required this.lastUpdated,
    required this.windSpeed,
    required this.visibility,
    required this.humidity,
  });

  List<int> toFeatureArray() {
    return [
      condition.toLowerCase().contains('rain') ? 1 : 0,  // Rainy
      condition.toLowerCase().contains('sunny') ? 1 : 0, // Sunny
      temperature >= 30 ? 1 : 0, // Hot temperature
      (temperature >= 20 && temperature < 30) ? 1 : 0, // Mild temperature
      humidity < 60 ? 1 : 0 // Normal humidity
    ];
  }
}

class ForecastDayEntity {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String iconUrl;

  ForecastDayEntity({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.iconUrl,
  });
}



