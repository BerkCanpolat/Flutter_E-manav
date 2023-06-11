import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_store.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/model/categoriesModel.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/screens/product_details/product_details.dart';

class CategoriesDetails extends StatefulWidget {
  final CategoryModel categoriesDetails;
  const CategoriesDetails({super.key, required this.categoriesDetails});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  List<CategoryModel> displayCategory = [];
  List<ProductsModel> displayProduct = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
  }

  void getCategory() async {
    setState(() {
      isLoading = !isLoading;
    });
    displayCategory = await StoreService.instance.categoryModel();
    displayProduct = await StoreService.instance
        .categoriesDetails(widget.categoriesDetails.id);
    displayProduct.shuffle();
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoriesDetails.name),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(Icons.notifications_none,color: Colors.black,), onPressed: (){}),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(Icons.shopping_bag_outlined,color: Colors.black,), onPressed: (){}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30),
                itemCount: displayProduct.length,
                itemBuilder: (context, index) {
                  ProductsModel pro = displayProduct[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 3),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              MainRoutes.instance.pushMain(
                                  widget: ProductDetails(productDetails: pro),
                                  context: context);
                            },
                            child: Image.network(
                              pro.image!,
                              width: 135,
                              height: 135,
                            )),
                        Text(
                          pro.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${pro.price} / Kg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
