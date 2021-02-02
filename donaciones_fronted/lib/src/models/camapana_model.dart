// To parse this JSON data, do
//
//     final camapanaModel = camapanaModelFromJson(jsonString);

import 'dart:convert';

CamapanaModel camapanaModelFromJson(String str) =>
    CamapanaModel.fromJson(json.decode(str));

String camapanaModelToJson(CamapanaModel data) => json.encode(data.toJson());

class CamapanaModel {
  CamapanaModel({
    this.id,
    this.nombre,
    this.user,
  });

  int id;
  String nombre;
  int user;

  factory CamapanaModel.fromJson(Map<String, dynamic> json) => CamapanaModel(
        id: json["id"],
        nombre: json["nombre"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "user": user,
      };
}
