import 'package:flutter/material.dart';
import 'package:flutter_e_manav/model/productsModel.dart';

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
}