import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/categoriesModel.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/model/usersModel.dart';

class StoreService{
  static StoreService instance = StoreService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> categoryModel() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").get();

      List<CategoryModel> catModel = querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      return catModel;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }



  Future<List<ProductsModel>> productModel() async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collectionGroup("products").get();

      List<ProductsModel> proModel = querySnapshot.docs.map((e) => ProductsModel.fromJson(e.data())).toList();

      return proModel;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }


  Future<List<ProductsModel>> categoriesDetails(String id) async{
    try {
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firestore.collection("categories").doc(id).collection("products").get();
      List<ProductsModel> catProList = querySnapshot.docs.map((e) => ProductsModel.fromJson(e.data())).toList();
      return catProList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }


  Future<UsersModel> fireStoreUserInformation() async{
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await _firestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    return UsersModel.fromJson(documentSnapshot.data()!);
  }
}