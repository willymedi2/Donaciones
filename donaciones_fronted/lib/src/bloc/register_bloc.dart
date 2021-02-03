import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:donaciones_fronted/src/bloc/validators.dart';

class RegisterBloc with Validators {
  final _correoController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get correoStream =>
      _correoController.stream.transform(validarCorreo);

  Stream<String> get telefonoStream =>
      _telefonoController.stream.transform(validarTelefono);

  Stream<String> get apellidoStream =>
      _apellidoController.stream.transform(validarApellido);

  Stream<String> get nameStream =>
      _nameController.stream.transform(validarNombre);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(correoStream, nameStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeCorreo => _correoController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get telefonoController => _nameController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get correo => _correoController.value;
  String get name => _nameController.value;

  dispose() {
    _correoController?.close();
    _nameController?.close();
    _apellidoController?.close();
  }
}
