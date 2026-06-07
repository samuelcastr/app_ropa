import '../models/garment.dart';
import '../models/outfit_request.dart';
import '../models/weather_type.dart';

class OutfitGeneratorService {

  int calculateScore(
    Garment garment,
    OutfitRequest request,
  ) {
    int score = 0;

    // Favoritas
    if (garment.isFavorite) {
      score += 30;
    }

    // Coincidencia de ocasión
    if (garment.occasion ==
        request.occasion) {
      score += 25;
    }

    // Coincidencia de temporada
    if (garment.season ==
            request.season ||
        garment.season ==
            'Todo el año') {
      score += 15;
    }

    // Nunca usada
    if (garment.lastWorn == null) {
      score += 20;
    }

    return score;
  }

  Garment getBestGarment(
    List<Garment> garments,
    OutfitRequest request,
  ) {
    garments.sort(
      (a, b) =>
          calculateScore(
            b,
            request,
          ).compareTo(
            calculateScore(
              a,
              request,
            ),
          ),
    );

    return garments.first;
  }

  List<Garment> generateOutfit({
    required List<Garment> garments,
    required OutfitRequest request,
  }) {
    if (garments.isEmpty) {
      return [];
    }

    final available =
        List<Garment>.from(
      garments,
    );

    // TOPS
    final tops =
        available.where((g) {
      return g.category ==
              'Blusa' ||
          g.category ==
              'Camiseta' ||
          g.category ==
              'Chaqueta';
    }).toList();

    // BOTTOMS
    final bottoms =
        available.where((g) {
      return g.category ==
              'Jean' ||
          g.category ==
              'Falda';
    }).toList();

    // SHOES
    final shoes =
        available.where((g) {
      return g.category ==
              'Tenis' ||
          g.category ==
              'Botas';
    }).toList();

    if (tops.isEmpty ||
        bottoms.isEmpty ||
        shoes.isEmpty) {
      return [];
    }

    // Selección inteligente
    Garment selectedTop =
        getBestGarment(
      tops,
      request,
    );

    Garment selectedBottom =
        getBestGarment(
      bottoms,
      request,
    );

    Garment selectedShoes =
        getBestGarment(
      shoes,
      request,
    );

    // Ajustes por clima
    switch (request.weather) {
      case WeatherType.rainy:

        final rainyShoes =
            shoes.where(
          (g) =>
              g.category ==
              'Botas',
        );

        if (rainyShoes
            .isNotEmpty) {
          selectedShoes =
              rainyShoes.first;
        }

        break;

      case WeatherType.cold:

        final jackets =
            tops.where(
          (g) =>
              g.category ==
              'Chaqueta',
        );

        if (jackets
            .isNotEmpty) {
          selectedTop =
              getBestGarment(
            jackets.toList(),
            request,
          );
        }

        break;

      case WeatherType.sunny:
      case WeatherType.cloudy:
        break;
    }

    // Ajustes por ocasión
    switch (request.occasion) {
      case 'Presentación':

        final elegantTop =
            tops.where(
          (g) =>
              g.category ==
              'Blusa',
        );

        if (elegantTop
            .isNotEmpty) {
          selectedTop =
              getBestGarment(
            elegantTop
                .toList(),
            request,
          );
        }

        break;

      case 'Evento Académico':

        final jackets =
            tops.where(
          (g) =>
              g.category ==
              'Chaqueta',
        );

        if (jackets
            .isNotEmpty) {
          selectedTop =
              getBestGarment(
            jackets.toList(),
            request,
          );
        }

        break;

      case 'Salida Casual':

        final tshirts =
            tops.where(
          (g) =>
              g.category ==
              'Camiseta',
        );

        if (tshirts
            .isNotEmpty) {
          selectedTop =
              getBestGarment(
            tshirts.toList(),
            request,
          );
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