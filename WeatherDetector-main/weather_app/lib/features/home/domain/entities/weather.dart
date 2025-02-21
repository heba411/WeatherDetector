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
