import 'package:firebase_database/firebase_database.dart';

class ShoppingService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('shopping_list');

  Stream<DatabaseEvent> getItems() => _dbRef.onValue;

  Future<void> addItem(String item) async {
    await _dbRef.push().set({'name': item});
  }

  Future<void> deleteItem(String key) async {
    await _dbRef.child(key).remove();
  }
}
