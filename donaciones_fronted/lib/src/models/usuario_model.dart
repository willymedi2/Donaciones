import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.user,
    this.nombre,
    this.apellido,
    this.telefono,
    this.correo,
    this.password,
  });

  int id;
  String user;
  String nombre;
  String apellido;
  String telefono;
  String correo;
  String password;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        user: json["user"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
        correo: json["correo"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
        "correo": correo,
        "password": password,
      };
}
