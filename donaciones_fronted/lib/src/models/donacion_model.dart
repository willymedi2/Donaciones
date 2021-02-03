// To parse this JSON data, do
//
//     final donacionModel = donacionModelFromJson(jsonString);

import 'dart:convert';

DonacionModel donacionModelFromJson(String str) =>
    DonacionModel.fromJson(json.decode(str));

String donacionModelToJson(DonacionModel data) => json.encode(data.toJson());

class DonacionModel {
  DonacionModel({
    this.id,
    this.categoria,
    this.metodo,
    this.observacion,
    this.user,
    this.campana,
    this.fecha,
  });

  int id;
  String categoria;
  String metodo;
  String observacion;
  int user;
  int campana;
  String fecha;

  factory DonacionModel.fromJson(Map<String, dynamic> json) => DonacionModel(
        id: json["id"],
        categoria: json["categoria"],
        metodo: json["metodo"],
        observacion: json["observacion"],
        user: json["user"],
        campana: json["campana"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "categoria": categoria,
        "metodo": metodo,
        "observacion": observacion,
        "user": user.toString(),
        "campana": campana.toString(),
        "fecha": DateTime.now().toString()
      };
}
