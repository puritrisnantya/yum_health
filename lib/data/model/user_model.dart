import 'package:cloud_firestore/cloud_firestore.dart';

class DataUser {
  DataUser({
    required this.username,
    required this.email,
    required this.createdAt,
  });

  final String username;
  final String email;
  final Timestamp createdAt;

  factory DataUser.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataUser(
        username: data["username"],
        email: data["email"],
        createdAt: data["createdAt"],
      );

  Map<String, dynamic> toObject() => {
        "username": username,
        "email": email,
        "createdAt": createdAt,
      };
}
