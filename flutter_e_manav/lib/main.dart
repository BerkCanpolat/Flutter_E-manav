import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_auth.dart';
import 'package:flutter_e_manav/constants/theme.dart';
import 'package:flutter_e_manav/ghost_folder/firebase_options.dart';
import 'package:flutter_e_manav/screens/Drawer/drawer.dart';
import 'package:flutter_e_manav/screens/auth/login/login.dart';
import 'package:flutter_e_manav/screens/auth/welcome/welcome.dart';
import 'package:flutter_e_manav/screens/home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthService.instance.getuserStateChange,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return DrawerScreen();
          }else{
            return Welcome();
          }
        },
      ),
      theme: themeData,
    );
  }
}