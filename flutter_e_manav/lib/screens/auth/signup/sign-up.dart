import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_auth.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/screens/Drawer/drawer.dart';
import 'package:flutter_e_manav/screens/auth/login/login.dart';
import 'package:flutter_e_manav/screens/home/home.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';
import 'package:flutter_e_manav/widgets/project_outlineButton.dart';
import 'package:flutter_e_manav/widgets/project_title.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text;
    password.text;
    name.text;
    phone.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          BackgroundTwo(),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            // width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12)),
                            child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 9),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Tekrar Hoşgeldin!",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Hesaba Giriş Yap",
                          style: TextStyle(letterSpacing: 1),
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "E-posta",
                              prefixIcon: Icon(Icons.email)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Şifre",
                              prefixIcon: Icon(Icons.vpn_key)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: name,
                          decoration: InputDecoration(
                              hintText: "İsim",
                              prefixIcon: Icon(Icons.account_circle)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          controller: phone,
                          decoration: InputDecoration(
                              hintText: "Telefon",
                              prefixIcon: Icon(Icons.call)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 38),
                  ProjectButton(
                    title: "Giriş Yap",
                    onPressed: () async{
                      bool isValidate = signUpValidate(email.text, password.text, name.text, phone.text);
                      if(isValidate){
                        bool isLogined = await AuthService.instance.signUpService(name.text, email.text, password.text, context);
                        if(isLogined){
                          MainRoutes.instance.pushMain(widget: Login(), context: context);
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Veya Giriş Yap"),
                  SizedBox(height: 15),
                  ProjectOutlieButton(
                    title: "Facebook İle Giriş Yap",
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ProjectOutlieButton(
                    title: "Apple İle Giriş Yap",
                    icon: Icon(
                      Icons.apple,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Henüz Hesabın Yok Mu?"),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                      "Hemen Kayıt Ol",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/welcome.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class BackgroundTwo extends StatelessWidget {
  const BackgroundTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.4),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
