import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/favourite/widget/SingleFavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Favoriler"),),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: appProvider.getFavourite.length,
        itemBuilder: (context, index) {
          return SingleFavourite(favoriteDetails: appProvider.getFavourite[index],);
        },
      ),
    );
  }
}
