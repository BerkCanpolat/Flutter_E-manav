import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleFavourite extends StatefulWidget {
  final ProductsModel favoriteDetails;
  const SingleFavourite({super.key,required this.favoriteDetails});

  @override
  State<SingleFavourite> createState() => _SingleFavouriteState();
}

class _SingleFavouriteState extends State<SingleFavourite> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Card(
            margin: EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      child: Image.network(widget.favoriteDetails.image!,fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        Text(widget.favoriteDetails.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 20,),
                        Text("\$ ${widget.favoriteDetails.price} / kg",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      ],
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                          appProvider.removeFavourite(widget.favoriteDetails);
                          showMessage("Favoriden kaldırıldı");
                        }
                        ),
                        ),
                  ],
                )
              ],
            ),
          );
  }
}