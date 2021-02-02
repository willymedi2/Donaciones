import 'dart:convert';

PersonaModel donacionModelFromJson(String str) =>
    PersonaModel.fromJson(json.decode(str));

String donacionModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel {
  PersonaModel({
    this.id,
    this.nombre,
    this.apellido,
    this.correo,
    this.telefono,
  });

  int id;
  String nombre;
  String apellido;
  String correo;
  String telefono;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "telefono": telefono,
      };
}
