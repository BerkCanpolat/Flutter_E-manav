import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_storage.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_store.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/model/usersModel.dart';

class AppProvider with ChangeNotifier {
  List<ProductsModel> _favorit = [];

  List<ProductsModel> get getFavourite => _favorit;

  void addFavourite(ProductsModel productsModel){
    _favorit.add(productsModel);
    notifyListeners();
  }


  void removeFavourite(ProductsModel productsModel){
    _favorit.remove(productsModel);
    notifyListeners();
  }



  List<ProductsModel> _card = [];

  List<ProductsModel> get getCart => _card;

  void addCart(ProductsModel productsModel){
    _card.add(productsModel);
    notifyListeners();
  }


  void removeCart(ProductsModel productsModel){
    _card.remove(productsModel);
    notifyListeners();
  }



    double totalPrice(){
    double totalPrice = 0.0;
    for(var element in _card){
      totalPrice += (element.totalPrice !* element.price!) as double;
    }
    return totalPrice;
  }

  void updatePrice(ProductsModel productsModel,int totalPrice){
    int index = _card.indexOf(productsModel);
    _card[index].totalPrice = totalPrice;
    notifyListeners();
  }


  UsersModel? _usersModel;

  UsersModel? get getUserInformation => _usersModel;

  void providerUserInformation() async{
    _usersModel = await StoreService.instance.fireStoreUserInformation();
    notifyListeners();
  }

  void updateProfile(BuildContext context, File file, UsersModel usersModel) async{
    if(file == null){
      showLoaderDialog(context);
      _usersModel = usersModel;
      await FirebaseFirestore.instance
      .collection("users")
      .doc(_usersModel?.id)
      .set(_usersModel!.toJson());
      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();
    }else{
      showLoaderDialog(context);
      String imageUrl = await Storage().uploadProfileImage(file);
      _usersModel = usersModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
      .collection("users")
      .doc(_usersModel?.id)
      .set(_usersModel!.toJson());
      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();
    }
    showMessage("Profil Güncellendi");
    notifyListeners();
  }
}