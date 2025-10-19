class Userr {
  static const String collectionName = 'users';
  String id;
  String name;
  String email;

  Userr({required this.id, required this.name, required this.email});

  Userr.fromFirestore(Map<String, dynamic> Data)
    : this(id: Data['id'], name: Data['name'], email: Data['email']);

  Map<String, dynamic> toFirestore() {
    return {'id': id, 'name': name, 'email': email};
  }
}
