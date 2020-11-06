import 'package:cloud_firestore/cloud_firestore.dart';

class UserApp {
  String id;
  String name;
  String email;
  String urlImage;

  UserApp({this.id, this.name, this.email, this.urlImage});

  UserApp.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.get("name"),
        email = snapshot.get("email"),
        urlImage = snapshot.get("urlImage");

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "urlImage": urlImage};
  }
}
