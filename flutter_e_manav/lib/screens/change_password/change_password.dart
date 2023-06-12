import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_auth.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şifre Değiştir"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kToolbarHeight,),
            TextFormField(
              controller: newPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: "Yeni Şifre"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: confirmPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: "Şifreyi Onayla"
              ),
            ),
            SizedBox(height: 30,),
            ProjectButton(title: "Güncelle", onPressed: () async{
              if(newPassword.text.isEmpty){
                showMessage("Yeni şifre boş olamaz");
              }else if(confirmPassword.text.isEmpty){
                showMessage("Lütfen şifrenizi onaylayınız");
              }else if(newPassword.text == confirmPassword.text){
                AuthService.instance.changePassword(newPassword.text, context);
              }else{
                showMessage("Şifreler uyuşmuyor!");
              }
            },)
          ],
        ),
      ),
    );
  }
}