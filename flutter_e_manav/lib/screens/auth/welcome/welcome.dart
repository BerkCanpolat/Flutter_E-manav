import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/screens/auth/login/login.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';
import 'package:flutter_e_manav/widgets/project_outlineButton.dart';
import 'package:flutter_e_manav/widgets/project_title.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          BackgroundTwo(),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight + 200),
            child: Column(
              children: [
                ProjectTitle(title: "Başlayalım", subtitle: "Kaydolun Veya Giriş Yapın, Yakınınızda Neler Olup", doublesubtitle: "Bittiğini Görün"),
                SizedBox(height: kToolbarHeight + 40,),
                ProjectButton(title: "E-Mail ile devam et",onPressed: (){
                  MainRoutes.instance.pushMain(widget: Login(), context: context);
                },),
                SizedBox(height: kToolbarHeight,),
                ProjectOutlieButton(title: "Facebook İle Giriş Yap", icon: Icon(Icons.facebook,color: Colors.blue,),onPressed: (){},),
                SizedBox(height: 12,),
                ProjectOutlieButton(title: "Apple İle Giriş Yap", icon: Icon(Icons.apple,color: Colors.black,),onPressed: (){},),
                SizedBox(height: kToolbarHeight,),
                ProjectTitle(title: "", subtitle: "Kaydolarak veya giriş yaparak Her Hizmet Şartını ve", doublesubtitle: "Gizlilik Politikasını kabul ediyorum")
              ],
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
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.3),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
