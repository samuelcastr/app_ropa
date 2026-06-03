class Garment {
  final int? id;
  final String name;
  final String category;
  final String color;
  final String size;
  final String brand;
  final String season;
  final String occasion;
  final String? imagePath;
  final bool isFavorite;
  final String? lastWorn;
  final String createdAt;

  Garment({
    this.id,
    required this.name,
    required this.category,
    required this.color,
    required this.size,
    required this.brand,
    required this.season,
    required this.occasion,
    this.imagePath,
    this.isFavorite = false,
    this.lastWorn,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'color': color,
      'size': size,
      'brand': brand,
      'season': season,
      'occasion': occasion,
      'imagePath': imagePath,
      'isFavorite': isFavorite ? 1 : 0,
      'lastWorn': lastWorn,
      'createdAt': createdAt,
    };
  }

  factory Garment.fromMap(Map<String, dynamic> map) {
    return Garment(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      color: map['color'],
      size: map['size'],
      brand: map['brand'],
      season: map['season'],
      occasion: map['occasion'],
      imagePath: map['imagePath'],
      isFavorite: map['isFavorite'] == 1,
      lastWorn: map['lastWorn'],
      createdAt: map['createdAt'],
    );
  }
}