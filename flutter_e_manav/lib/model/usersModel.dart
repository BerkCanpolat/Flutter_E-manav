// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    String id;
    String name;
    String email;

    UsersModel({
        required this.id,
        required this.name,
        required this.email,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}
