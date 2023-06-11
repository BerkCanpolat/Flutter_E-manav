import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/cardscreen/cardScreen.dart';
import 'package:flutter_e_manav/screens/home/home.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  
  var changePage = [Home()];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page == 0 ? "E-Manav" : page == 1 ? "Favourite" : page == 2 ? "Kart" : "login",style: TextStyle(color: Colors.black)),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(page == 0 ? Icons.shopping_bag_outlined : page == 0 ? Icons.favorite : Icons.access_alarm_outlined,color: Colors.black,), 
            onPressed: (){
              page == 0 ? MainRoutes.instance.pushMain(widget: CartScreen(), context: context) : Text("HATA");
            }
            ),
        ],
        centerTitle: true,
        elevation: 0.0,
        ),
      body: changePage[page],
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            shrinkWrap: true,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                accountName: Text("Berk Canpolat"),
                accountEmail: Text("canpolatberk19@gmail.com"),
                currentAccountPicture: Image.network(
                    "https://images.unsplash.com/photo-1685950871149-b2cee6808f27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
              ),
              ListTile(
                title: Text("Anasayfa"),
                onTap: () {
                  setState(() {
                    page = 0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Favoriler"),
              ),
              ListTile(
                title: Text("Kart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
