import 'dart:convert';

ProductsModel categoryModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String categoryModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    String? id;
    String? name;
    String? image;
    String? description;
    double? price;
    String? status;
    int? totalPrice;
    bool? isFavourite;

    ProductsModel({
        required this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.price,
        required this.status,
        this.totalPrice,
        required this.isFavourite

    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        // price: json["price"],
        price: double.parse(json["price"].toString()),
        status: json["status"],
        totalPrice: json["totalPrice"],
        isFavourite: false
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "status": status,
        "totalPrice": totalPrice,
        "isFavourite": isFavourite,
    };
    @override
    ProductsModel copyWith({
      int? totalPrice,
    }) => 
    ProductsModel(
        id: id,
        name: name,
        image: image,
        price: price,
        description: description,
        status: status,
        isFavourite: isFavourite,
        totalPrice: totalPrice ?? this.totalPrice,
    );
}