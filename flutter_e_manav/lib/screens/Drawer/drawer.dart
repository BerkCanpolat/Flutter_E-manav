import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_auth.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/auth/login/login.dart';
import 'package:flutter_e_manav/screens/auth/welcome/welcome.dart';
import 'package:flutter_e_manav/screens/cardscreen/cardScreen.dart';
import 'package:flutter_e_manav/screens/change_password/change_password.dart';
import 'package:flutter_e_manav/screens/edit_page/edit.dart';
import 'package:flutter_e_manav/screens/favourite/favourite.dart';
import 'package:flutter_e_manav/screens/home/home.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';
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
    AppProvider? provider = Provider.of<AppProvider>(context);
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
                  color: Colors.green,
                ),
                accountName: provider.getUserInformation?.name == null ? Text("HATA") : Text(provider.getUserInformation!.name!),
                accountEmail: provider.getUserInformation?.email == null ? Text("HATA") : Text(provider.getUserInformation!.email!),
                currentAccountPicture: provider.getUserInformation?.image == null ? Image.network(
                    "https://gidasepeti.net/wp-content/uploads/2020/03/637045913227911637.png"
                    )
                    : CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(provider.getUserInformation!.image!),
                    )
              ),
              ListTile(
                title: Text("Anasayfa"),
                onTap: () {
                  setState(() {
                    page = 0;
                  });
                  Navigator.of(context).pop();
                },
                trailing: Icon(Icons.home_outlined,color: Colors.green,),
              ),
              ListTile(
                onTap: (){
                  MainRoutes.instance.pushMain(widget: CartScreen(), context: context);
                },
                title: Text("Karttaki ürünlerim"),
                trailing: Icon(Icons.shopping_bag_outlined,color: Colors.green,),
              ),
              ListTile(
                onTap: (){
                  MainRoutes.instance.pushMain(widget: FavouriteScreen(), context: context);
                },
                title: Text("Favorilerim"),
                trailing: Icon(Icons.favorite_border,color: Colors.green,),
              ),
              ListTile(
                onTap: (){
                  MainRoutes.instance.pushMain(widget: ChangePassword(), context: context);
                },
                title: Text("Şifre Değiştir"),
                trailing: Icon(Icons.change_circle_outlined,color: Colors.green,),
              ),
              ListTile(
                onTap: (){},
                title: Text("Destek"),
                trailing: Icon(Icons.support_agent,color: Colors.green,),
              ),
              ListTile(
                onTap: (){},
                title: Text("Hakkımızda"),
                trailing: Icon(Icons.info_outline,color: Colors.green,),
              ),
              ListTile(
                onTap: (){
                  setState(() {
                    AuthService.instance.signOut();
                    MainRoutes.instance.pushAndRemoveBack(widget: Welcome(), context: context);
                  });
                },
                title: Text("Çıkış Yap",style: TextStyle(color: Colors.red),),
                trailing: Icon(Icons.logout,color: Colors.red,),
              ),
              SizedBox(height: kToolbarHeight + 50,),
              ListTile(
                title: ProjectButton(title: "Profili Düzenle", onPressed: (){
                  MainRoutes.instance.pushMain(widget: EditPage(), context: context);
                }),
              ),
              ListTile(
                title: Text("Version 1.0.0"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
