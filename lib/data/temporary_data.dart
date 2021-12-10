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
    title: 'Omelet Sayur',
    description:
        'Telur dadar atau omelet adalah variasi hidangan telur goreng yang disiapkan dengan cara mengocok telur dan menggorengnya dengan minyak goreng atau mentega panas di sebuah wajan. ',
    imageAsset: 'images/omelet_sayur.jpg',
    label: 'Obesitas',
    ingredients:
        'Nori (Rumput laut, 21x19 cm) : 1 lembar\nNasi Sushi* : ± 170 gram\nSelada : 1 lembar besar\nKepiting Kamaboko (pasta ikan) : 2 potong\nTelur Dadar Panggang : sesuai selera\nAlpukat :sesuai selera\nTelur ikan terbang : sesuai selera',
    steps:
        '1. Kocok lepas telur, masukkan semua bahan, lalu goreng di teflon dengan api kecil.\n2. Masak sampai omelet bagian atas set, lalu balik satu bagiannya lagi, lalu masak sampai kekuningan.\n3. Angkat lalu potong, sajikan dengan saus sambal dan mayonaise.',
  ),
  Resep(
    id: '2',
    title: 'Kue tiramisu',
    description:
        'Tiramisu seperti yang kita kenal sekarang ini terbuat dari lapisan Savoiardi (biskuit ladyfinger) yang satu per satu dicampurkan ke dalam mascarpone (keju krim khas Italia)dan campuran bubuk kopi. Beberapa koki juga menambahkan Wine Marsala dan taburan cokelat bubuk.',
    imageAsset: 'images/kue_tiramisu.jpg',
    label: 'Kecenderungan Obesitas',
    ingredients:
        '2 butir telur (70 gr)\n2 sachet Diabetasol sweetener\n1 sachet Nescafe classic (2 g)\n30 gr tepung terigu (3 sendok makan)\n1 sdt baking powder\n1 bungkus yogurt Cimory squeeze\nBubuk coklat untuk taburan (optional)',
    steps:
        '1. Kocok putih telur sampai mengembang dan kaku\n2. Tambahkan tepung terigu, sweetener, baking powder dan Nescafe ke adonan telur sedikit demi sedikit\n3. Setelah tercampur rata tuang ke loyang yang telah diolesi margarin dan tepung atau kertas roti\n4. Panaskan dandang dan kukus selama 15-20 menit\n5. Setelah matang bagi 2 kue dan isi/hias dengan yogurt serta topping cocoa powder\n6. Supaya optimal simpan dahulu di kulkas kurang lebih 6 jam sebelum disajikan.',
  ),
  Resep(
      id: '3',
      title: 'Pecel',
      description:
          'Pecel atau pecal merupakan makanan berasal dari pulau Jawa, makanan ini biasanya dihidangkan dengan bumbu sambal kacang sebagai bahan utamanya dan dicampur dengan aneka jenis sayuran.',
      imageAsset: 'images/pecel.jpg',
      label: 'Normal',
      ingredients:
          "5 buah tahu, potong dadu\n1/2 siung bawang putih\n2 lembar daun seledri\n4 sendok makan kecap manis\n5 buah cabai rawit\nbawang goreng secukupnya\ngaram secukupnya\nminyak goreng secukupnya\nsegenggam kacang tanah, goreng",
      steps:
          "1. Panaskan minyak, goreng tahu setengah matang.\n2. Ulek kacang tanah, cabai, bawang putih, dan garam hingga halus.\n3. Tambahkan kecap dan aduk hingga rata.\n4. Campur tahu goreng dan bumbu, lalu penyet hingga setengah hancur.\n5. Tambahkan daun seledri dan bawang goreng."),
];
