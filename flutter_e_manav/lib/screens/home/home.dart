import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_store.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/constants/routes.dart';
import 'package:flutter_e_manav/model/categoriesModel.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/screens/Drawer/drawer.dart';
import 'package:flutter_e_manav/screens/categories_details/categories_details.dart';
import 'package:flutter_e_manav/screens/product_details/product_details.dart';
import 'package:flutter_e_manav/screens/research/research.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> displayCategory = [];
  List<ProductsModel> displayProduct = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
    AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
    appProvider.providerUserInformation();
  }

  void getCategory() async {
    setState(() {
      isLoading = !isLoading;
    });
    displayCategory = await StoreService.instance.categoryModel();
    displayProduct = await StoreService.instance.productModel();
    displayProduct.shuffle();
    if(this.mounted){
    setState(() {
      isLoading = !isLoading;
    });
    }
  }

  final TextEditingController showUser = TextEditingController();
  bool iShowUser = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    showUser.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
   return iShowUser ? Scaffold(
      body: 
      FutureBuilder(
                  future: FirebaseFirestore.instance.collection("categories").where("name",isEqualTo: showUser.text).get(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30
                  ), 
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10,top: 3),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.favorite_border,color: Colors.black,),
                            ),
                          ),
                          Image.network(snapshot.data?.docs[index]["image"],width: 135,height: 135,),
                          Text(snapshot.data?.docs[index]["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 5,),
                        ],
                      ),
                    );
                  },
                  ),
              );
                  },
                ),
    ) :
      isLoading ? Center(child: CircularProgressIndicator(),) : Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                TextFormField(
                  controller: showUser,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          iShowUser = true;
                        });
                      },
                  cursorColor: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 25),
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ferahlatıcı",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Avocado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Image.network(
                            "https://dudu-food.de/wp-content/uploads/2019/12/Avocado-1.png",
                            scale: 4,
                          ),
                        ],
                      )),
                ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kategoriler",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    Text("Hepsini Gör..",style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              displayProduct.isEmpty ? Text("Boş") : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(
                    children: displayCategory
                      .map(
                        (e) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: InkWell(
                            onTap: () {
                              MainRoutes.instance.pushMain(widget: CategoriesDetails(categoriesDetails: e), context: context);
                            },
                            child: Container(
                              width: 280,
                              height: 145,
                              decoration: BoxDecoration(
                                 color: Colors.red,
                                 borderRadius: BorderRadius.circular(12)
                              ),
                              child: Image.network(
                                e.image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ).toList(),
                  )
                      ),
                      SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30
                  ), 
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
                            padding: const EdgeInsets.only(right: 10,top: 3),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                                  setState(() {
                                    pro.isFavourite = !pro.isFavourite!;
                                    if(pro.isFavourite!){
                                      appProvider.addFavourite(pro);
                                      showMessage("Favoriye eklendi");
                                    }else{
                                      appProvider.removeFavourite(pro);
                                      showMessage("Favoriden kaldırıldı");
                                    }
                                  });
                                },
                                child: appProvider.getFavourite.contains(pro) ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border,color: Colors.black,) 
                                ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              MainRoutes.instance.pushMain(widget: ProductDetails(productDetails: pro), context: context);
                            },
                            child: Image.network(pro.image!,width: 135,height: 135,)),
                          Text(pro.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 5,),
                          Text("${pro.price} / Kg",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      ),
                    );
                  },
                  ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      )
    );
  }
}
