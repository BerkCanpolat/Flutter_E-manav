import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  static Storage instance = Storage();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage(File ime) async{
    String userUid = FirebaseAuth.instance.currentUser!.uid;
    TaskSnapshot taskSnapshot = await _storage.ref(userUid).putFile(ime);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}