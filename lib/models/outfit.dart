class Outfit {
  final int? id;

  final String name;

  final int? topId;
  final int? bottomId;
  final int? shoesId;
  final int? accessoryId;

  final String? notes;

  final String createdAt;

  Outfit({
    this.id,
    required this.name,
    this.topId,
    this.bottomId,
    this.shoesId,
    this.accessoryId,
    this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'topId': topId,
      'bottomId': bottomId,
      'shoesId': shoesId,
      'accessoryId': accessoryId,
      'notes': notes,
      'createdAt': createdAt,
    };
  }

  factory Outfit.fromMap(
    Map<String, dynamic> map,
  ) {
    return Outfit(
      id: map['id'],
      name: map['name'],
      topId: map['topId'],
      bottomId: map['bottomId'],
      shoesId: map['shoesId'],
      accessoryId: map['accessoryId'],
      notes: map['notes'],
      createdAt: map['createdAt'],
    );
  }
}