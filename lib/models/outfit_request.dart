import 'weather_type.dart';

class OutfitRequest {
  final String occasion;
  final WeatherType weather;

  OutfitRequest({
    required this.occasion,
    required this.weather,
  });
}