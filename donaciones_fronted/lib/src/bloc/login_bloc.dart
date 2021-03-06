import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:donaciones_fronted/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _correoController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get userStream =>
      _userController.stream.transform(validarUsuario);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  //Registrarse
  Stream<String> get correoStream =>
      _correoController.stream.transform(validarCorreo);

  Stream<String> get telefonoStream =>
      _telefonoController.stream.transform(validarTelefono);

  Stream<String> get apellidoStream =>
      _apellidoController.stream.transform(validarApellido);

  Stream<String> get nameStream =>
      _nameController.stream.transform(validarNombre);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(userStream, passwordStream, (e, p) => true);

  Stream<bool> get formValidRegisterStream => Rx.combineLatest6(
      userStream,
      passwordStream,
      correoStream,
      nameStream,
      telefonoStream,
      apellidoStream,
      (a, b, c, d, e, f) => true);
  //Insertar valores al Stream
  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeCorreo => _correoController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get changeTelefono => _telefonoController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get user => _userController.value;
  String get password => _passwordController.value;
  String get correo => _correoController.value;
  String get name => _nameController.value;
  String get apellido => _apellidoController.value;
  String get telefono => _telefonoController.value;

  dispose() {
    _userController?.close();
    _passwordController?.close();
    _apellidoController?.close();
    _nameController?.close();
    _correoController?.close();
    _telefonoController?.close();
  }
}
