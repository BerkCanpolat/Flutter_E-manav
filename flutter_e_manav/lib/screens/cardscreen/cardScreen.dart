import 'package:flutter/material.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/cardscreen/widget/singleCart.dart';
import 'package:flutter_e_manav/screens/favourite/widget/SingleFavourite.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Kart"),),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: appProvider.getCart.length,
        itemBuilder: (context, index) {
          return SingleCart(cartDetails: appProvider.getCart[index]);
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    Text(
                      "\$${appProvider.totalPrice().toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                ],
              ),
              SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
