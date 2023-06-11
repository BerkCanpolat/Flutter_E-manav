import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/favourite/favourite.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductsModel productDetails;
  const ProductDetails({super.key,required this.productDetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int price = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.productDetails.name}"),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: appProvider.getFavourite.contains(widget.productDetails) ? Icon(Icons.notification_add,color: Colors.red,) : Icon(Icons.notifications,color: Colors.black,),
            onPressed: (){
              MainRoutes.instance.pushMain(widget: FavouriteScreen(), context: context);
            },
            ),
        ],
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 400,
                  child: Image.network("${widget.productDetails.image}",scale: 2,),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.productDetails.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Text("\$${widget.productDetails.price} / kg",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(widget.productDetails.description!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      maxRadius: 16,
                      child: Icon(Icons.add,color: Colors.white,),
                    ), onPressed: (){
                      setState(() {
                        price++;
                      });
                    }
                    ),
                    Text(price.toString()),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      maxRadius: 16,
                      child: Icon(Icons.remove,color: Colors.white,),
                    ), onPressed: (){
                      setState(() {
                        if(price > 1){
                          price--;
                        }
                      });
                    }
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Card(
                elevation: 50,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: (){
                        setState(() {
                          widget.productDetails.isFavourite = !widget.productDetails.isFavourite!;
                          if(widget.productDetails.isFavourite!){
                            appProvider.addFavourite(widget.productDetails);
                            showMessage("Favori'ye eklendi");
                          }else{
                            appProvider.removeFavourite(widget.productDetails);
                            showMessage("Favoriden kaldırıldı");
                          }
                        });
                      }, child: Icon(appProvider.getFavourite.contains(widget.productDetails) ? Icons.favorite : Icons.favorite_border_outlined)),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ProjectButton(
                            title: "Karta Ekle",
                            onPressed: (){
                              ProductsModel productsModel = widget.productDetails.copyWith(totalPrice: price);
                              appProvider.addCart(productsModel);
                              showMessage("Ürün Kart'a Eklendi");
                            },
                            ),
                          ),
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}