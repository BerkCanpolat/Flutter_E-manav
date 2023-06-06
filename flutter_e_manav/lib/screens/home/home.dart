import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_manav/FirebaseHelper/firebase_store.dart';
import 'package:flutter_e_manav/model/categoriesModel.dart';
import 'package:flutter_e_manav/model/productsModel.dart';
import 'package:flutter_e_manav/screens/Drawer/drawer.dart';

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
  }

  void getCategory() async {
    setState(() {
      isLoading = !isLoading;
    });
    displayCategory = await StoreService.instance.categoryModel();
    displayProduct = await StoreService.instance.productModel();
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: CircularProgressIndicator(),) : Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
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
                          child: Container(
                            width: 300,
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
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ), 
                  itemCount: displayProduct.length,
                  itemBuilder: (context, index) {
                    ProductsModel pro = displayProduct[index];
                    return Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Container(
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
                                child: Icon(Icons.favorite_border),
                              ),
                            ),
                            Image.network(pro.image!,width: 150,height: 150,),
                            Text(pro.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 5,),
                            Text("${pro.price} / Kg",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                          ],
                        ),
                      ),
                    );
                  },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
