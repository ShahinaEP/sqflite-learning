// To parse this JSON data, do
//
//     final profliteModel = profliteModelFromJson(jsonString);

import 'dart:convert';

ProfliteModel profliteModelFromJson(String str) => ProfliteModel.fromJson(json.decode(str));

String profliteModelToJson(ProfliteModel data) => json.encode(data.toJson());

class ProfliteModel {
  ProfliteModel({
    this.id,
    this.username,
    this.address,
    this.phone,
    this.birthDate,
    this.email,
    this.createdAt,
  });

  String? id;
  String? username;
  String? address;
  String? phone;
  DateTime? birthDate;
  String? email;
  DateTime? createdAt;

  factory ProfliteModel.fromJson(Map<String, dynamic> json) => ProfliteModel(
    id: json["id"],
    username: json["username"],
    address: json["address"],
    phone: json["phone"],
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
    email: json["email"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "address": address,
    "phone": phone,
    "birthDate": birthDate?.toIso8601String(),
    "email": email,
    "createdAt": createdAt?.toIso8601String(),
  };
}