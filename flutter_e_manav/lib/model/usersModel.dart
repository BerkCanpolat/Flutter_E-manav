// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    String? id;
    String? name;
    String? email;
    String? image;

    UsersModel({
        required this.id,
        required this.name,
        required this.email,
        required this.image
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image":image
    };


    UsersModel copyWith({
    String? name,image,
    }) => 
    UsersModel(
        id: id,
        name: name??this.name,
        image: image??this.image,
        email: email,
    );
}
