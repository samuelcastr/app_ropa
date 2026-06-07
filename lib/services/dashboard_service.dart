import '../models/dashboard_stats.dart';
import '../models/garment.dart';
import '../models/outfit.dart';

class DashboardService {

  DashboardStats generateStats({
    required List<Garment> garments,
    required List<Outfit> outfits,
  }) {

    final totalGarments =
        garments.length;

    final favoriteGarments =
        garments
            .where(
              (g) => g.isFavorite,
            )
            .length;

    final totalOutfits =
        outfits.length;

    String mostUsedCategory =
        'Sin datos';

    String mostUsedColor =
        'Sin datos';

    if (garments.isNotEmpty) {

      final categories =
          <String, int>{};

      final colors =
          <String, int>{};

      for (final garment
          in garments) {

        categories.update(
          garment.category,
          (value) =>
              value + 1,
          ifAbsent: () => 1,
        );

        colors.update(
          garment.color,
          (value) =>
              value + 1,
          ifAbsent: () => 1,
        );
      }

      mostUsedCategory =
          categories.entries
              .reduce(
                (a, b) =>
                    a.value >
                            b.value
                        ? a
                        : b,
              )
              .key;

      mostUsedColor =
          colors.entries
              .reduce(
                (a, b) =>
                    a.value >
                            b.value
                        ? a
                        : b,
              )
              .key;
    }

    return DashboardStats(
      totalGarments:
          totalGarments,

      favoriteGarments:
          favoriteGarments,

      totalOutfits:
          totalOutfits,

      mostUsedCategory:
          mostUsedCategory,

      mostUsedColor:
          mostUsedColor,
    );
  }
}