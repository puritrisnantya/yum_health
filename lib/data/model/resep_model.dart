import 'package:cloud_firestore/cloud_firestore.dart';

class ResepData {
  late String id;
  late String name;
  late String description;
  late String imageLink;
  late String label;
  late List ingredients;
  late List steps;

  ResepData.fromObject(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    id = data.id;
    name = data['name'];
    description = data['description'];
    imageLink = data['imageLink'];
    label = data['label'];
    ingredients = data['ingredients'];
    steps = data['steps'];
  }

  ResepData.fromDocumentObject(DocumentSnapshot<Map<String, dynamic>> data) {
    id = data.id;
    name = data['name'];
    description = data['description'];
    imageLink = data['imageLink'];
    label = data['label'];
    ingredients = data['ingredients'];
    steps = data['steps'];
  }
}
