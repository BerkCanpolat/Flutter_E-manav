import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:provider/provider.dart';

class SingleCart extends StatefulWidget {
  final ProductsModel cartDetails;
  const SingleCart({super.key,required this.cartDetails});

  @override
  State<SingleCart> createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {

  int price = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.cartDetails.totalPrice ?? 1;
  }

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
                      child: Image.network(widget.cartDetails.image!,fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        Text(widget.cartDetails.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 20,),
                        Text("\$ ${widget.cartDetails.price} / kg",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      ],
                    ),
                    SizedBox(width: 25,),
                    Column(
                      children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      maxRadius: 12,
                      child: Icon(Icons.add,color: Colors.white,),
                    ), onPressed: (){
                      setState(() {
                        price++;
                      });
                      appProvider.updatePrice(widget.cartDetails, price);
                    }
                    ),
                    Text(price.toString()),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      maxRadius: 12,
                      child: Icon(Icons.remove,color: Colors.white,),
                    ), onPressed: (){
                        if(price > 1){
                          setState(() {
                            price--;
                          });
                          appProvider.updatePrice(widget.cartDetails, price);
                        }
                    }
                    ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                          appProvider.removeCart(widget.cartDetails);
                          showMessage("Ürün Kartlardan kaldırıldı");
                        }))
                  ],
                ),
              ],
            ),
          );
  }
}