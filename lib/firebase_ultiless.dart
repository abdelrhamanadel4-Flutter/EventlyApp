import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/Event.dart';
import 'package:evently/model/user.dart';

class FirebaseUltiless {
  static CollectionReference<dynamic> addCOlectioninfirestore(String uid) {
    return addCOlectionuserinfirestore()
        .doc(uid)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFirestore(snapshot.data()!),
          toFirestore: (event, options) => event.toFirebase(),
        );
  }

  static addEventinfirestore(Event event, String uid) {
    var collectionRef = addCOlectioninfirestore(uid);
    var docref = collectionRef.doc();
    event.id = docref.id;
    return docref.set(event);
  }

  static CollectionReference<Userr> addCOlectionuserinfirestore() {
    return FirebaseFirestore.instance
        .collection(Userr.collectionName)
        .withConverter<Userr>(
          fromFirestore: (snapshot, options) =>
              Userr.fromFirestore(snapshot.data()!),
          toFirestore: (Userr, options) => Userr.toFirestore(),
        );
  }

  static Future<void> updateEventinfirestore(Userr myuser) {
    return addCOlectionuserinfirestore().doc(myuser.id).set(myuser);
  }

  static Future<Userr?> readuser(String uid) async {
    var docSnapshot = await addCOlectionuserinfirestore().doc(uid).get();
    return docSnapshot.data();
  }
  static Future<void> adduser(String uid, String name, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'id': uid,
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }




}
