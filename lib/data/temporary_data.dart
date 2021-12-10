class Resep {
  String id;
  String title;
  String description;
  String imageAsset;
  String label;
  String ingredients;
  String steps;

  Resep({
    required this.id,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.label,
    required this.ingredients,
    required this.steps,
  });

  factory Resep.fromJson(Map<String, dynamic> json) => Resep(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageAsset: json["imageAsset"],
        label: json["label"],
        ingredients: json["ingredients"],
        steps: json["steps"],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageAsset': imageAsset,
      'label': label,
      'ingredients': ingredients,
      'steps': steps,
    };
  }
}

var resepList = [
  Resep(
    id: '1',
    title: 'Sushi Hiro 1',
    description:
        'Aburi Salmon Spicy, salmonnya fresh, dagingnya empuk dan halus. Enak! Salmon Volcano Roll, ini menu favorit saya, rasanya selalu enak dan must order! Aburi Salmon Belly, ini ....',
    imageAsset: 'images/sushi.jpg',
    label: 'Obesitas',
    ingredients:
        'Nori (Rumput laut, 21x19 cm) : 1 lembar\nNasi Sushi* : ± 170 gram\nSelada : 1 lembar besar\nKepiting Kamaboko (pasta ikan) : 2 potong\nTelur Dadar Panggang : sesuai selera\nAlpukat :sesuai selera\nTelur ikan terbang : sesuai selera',
    steps:
        'Letakkan selembar nori di atas rolling mat, lalu sebarkan nasi di atas nori dan ratakan. Tutupi nasi dengan plastic wrap, tahan nori dengan tangan lalu balik.',
  ),
  Resep(
    id: '2',
    title: 'Sushi Hiro 2',
    description:
        'Aburi Salmon Spicy, salmonnya fresh, dagingnya empuk dan halus. Enak! Salmon Volcano Roll, ini menu favorit saya, rasanya selalu enak dan must order! Aburi Salmon Belly, ini ....',
    imageAsset: 'images/sushi.jpg',
    label: 'Obesitas',
    ingredients:
        'Nori (Rumput laut, 21x19 cm) : 1 lembar\nNasi Sushi* : ± 170 gram\nSelada : 1 lembar besar\nKepiting Kamaboko (pasta ikan) : 2 potong\nTelur Dadar Panggang : sesuai selera\nAlpukat :sesuai selera\nTelur ikan terbang : sesuai selera',
    steps:
        'Letakkan selembar nori di atas rolling mat, lalu sebarkan nasi di atas nori dan ratakan. Tutupi nasi dengan plastic wrap, tahan nori dengan tangan lalu balik.',
  ),
  Resep(
    id: '3',
    title: 'Sushi Hiro 3',
    description:
        'Aburi Salmon Spicy, salmonnya fresh, dagingnya empuk dan halus. Enak! Salmon Volcano Roll, ini menu favorit saya, rasanya selalu enak dan must order! Aburi Salmon Belly, ini ....',
    imageAsset: 'images/sushi.jpg',
    label: 'Obesitas',
    ingredients:
        'Nori (Rumput laut, 21x19 cm) : 1 lembar\nNasi Sushi* : ± 170 gram\nSelada : 1 lembar besar\nKepiting Kamaboko (pasta ikan) : 2 potong\nTelur Dadar Panggang : sesuai selera\nAlpukat :sesuai selera\nTelur ikan terbang : sesuai selera',
    steps:
        'Letakkan selembar nori di atas rolling mat, lalu sebarkan nasi di atas nori dan ratakan. Tutupi nasi dengan plastic wrap, tahan nori dengan tangan lalu balik.',
  ),
];
