import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> addData(regData) async {
    Firestore.instance.collection("users").add(regData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await Firestore.instance.collection("users").snapshots();
  }
}
