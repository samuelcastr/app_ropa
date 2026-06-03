import '../models/garment.dart';
import '../models/outfit_request.dart';
import '../models/weather_type.dart';

class OutfitGeneratorService {
  List<Garment> generateOutfit({
    required List<Garment> garments,
    required OutfitRequest request,
  }) {
    if (garments.isEmpty) {
      return [];
    }

    final available = List<Garment>.from(garments);

    // Priorizar favoritos
    available.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) {
        return -1;
      }

      if (!a.isFavorite && b.isFavorite) {
        return 1;
      }

      return 0;
    });

    // TOPS
    final tops = available.where((g) {
      return g.category == 'Blusa' ||
          g.category == 'Camiseta' ||
          g.category == 'Chaqueta';
    }).toList();

    // BOTTOMS
    final bottoms = available.where((g) {
      return g.category == 'Jean' ||
          g.category == 'Falda';
    }).toList();

    // SHOES
    final shoes = available.where((g) {
      return g.category == 'Tenis' ||
          g.category == 'Botas';
    }).toList();

    if (tops.isEmpty ||
        bottoms.isEmpty ||
        shoes.isEmpty) {
      return [];
    }

    Garment selectedTop = tops.first;
    Garment selectedBottom = bottoms.first;
    Garment selectedShoes = shoes.first;

    // Reglas por clima
    switch (request.weather) {
      case WeatherType.rainy:
        final rainyShoes = shoes.where(
          (g) => g.category == 'Botas',
        );

        if (rainyShoes.isNotEmpty) {
          selectedShoes = rainyShoes.first;
        }
        break;

      case WeatherType.cold:
        final jackets = tops.where(
          (g) => g.category == 'Chaqueta',
        );

        if (jackets.isNotEmpty) {
          selectedTop = jackets.first;
        }
        break;

      case WeatherType.sunny:
      case WeatherType.cloudy:
        break;
    }

    // Reglas por ocasión
    switch (request.occasion) {
      case 'Presentación':
        final elegantTop = tops.where(
          (g) =>
              g.category == 'Blusa',
        );

        if (elegantTop.isNotEmpty) {
          selectedTop = elegantTop.first;
        }

        break;

      case 'Evento Académico':
        final jackets = tops.where(
          (g) =>
              g.category ==
              'Chaqueta',
        );

        if (jackets.isNotEmpty) {
          selectedTop =
              jackets.first;
        }

        break;

      case 'Salida Casual':
        final tshirts = tops.where(
          (g) =>
              g.category ==
              'Camiseta',
        );

        if (tshirts.isNotEmpty) {
          selectedTop =
              tshirts.first;
        }

        break;

      case 'Universidad':
        break;
    }

    return [
      selectedTop,
      selectedBottom,
      selectedShoes,
    ];
  }
}