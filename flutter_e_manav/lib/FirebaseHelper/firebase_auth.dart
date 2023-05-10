import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/usersModel.dart';

class AuthService{
  static AuthService instance = AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> loginService(String email, String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.code.toString());
      return false;
    }
  }

  Future<bool> signUpService(String name,String email,String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UsersModel model = UsersModel(id: credential.user!.uid, name: name, email: email);
      _firestore.collection("users").doc(model.id).set(model.toJson());
      Navigator.pop(context);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.code.toString());
      return false;
    }
  }
}