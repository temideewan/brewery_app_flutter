import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';

class DatabaseService {
  // we use the id to sort of make sure each collection created is attached to a unique user
  final String uid;

  DatabaseService({this.uid});
  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
  Future updateUserPreference(String sugars, String name, int strength) async {
    // this function we call on the unique instance of a documentn on the brews collection and then call the set data function on it to set the property of the data
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // get brews stream
  // a getter for brews

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }
}
