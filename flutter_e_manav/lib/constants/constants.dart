import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.lightGreen,
    fontSize: 18,
    textColor: Colors.black
  );
}

showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.green,),
          Text("Yükleniyor..")
        ],
      );
    },),
  );
  showDialog(
    context: context, 
    barrierDismissible: true,
    builder: (BuildContext context){
      return alert;
    }
    );
}

bool loginValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Email Ve Şifre Boş!");
    return false;
  }else if(email.isEmpty){
    showMessage("E-Posta Boş!");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre Boş!");
    return false;
  }else{
    return true;
  }
}


bool signUpValidate(String email, String password,String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    showMessage("Bütün Kutucukları Doldurmalısın!");
    return false;
  }else if(email.isEmpty){
    showMessage("E-Posta Boş!");
    return false;
  }else if(name.isEmpty){
    showMessage("İsim Boş!");
    return false;
  }else if(phone.isEmpty){
    showMessage("Telefon Boş!");
    return false;
  }
  else if(password.isEmpty){
    showMessage("Şifre Boş!");
    return false;
  }else{
    return true;
  }
}