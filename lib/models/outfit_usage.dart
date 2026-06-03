class OutfitUsage {
  final int? id;
  final int outfitId;
  final String usedAt;

  OutfitUsage({
    this.id,
    required this.outfitId,
    required this.usedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'outfitId': outfitId,
      'usedAt': usedAt,
    };
  }

  factory OutfitUsage.fromMap(Map<String, dynamic> map) {
    return OutfitUsage(
      id: map['id'],
      outfitId: map['outfitId'],
      usedAt: map['usedAt'],
    );
  }
}