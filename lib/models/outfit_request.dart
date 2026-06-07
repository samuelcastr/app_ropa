import 'weather_type.dart';

class OutfitRequest {
  final String occasion;
  final WeatherType weather;
  final String season;

  OutfitRequest({
    required this.occasion,
    required this.weather,
    required this.season,
  });
}