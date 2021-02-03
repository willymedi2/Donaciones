import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:donaciones_fronted/src/bloc/validators.dart';

class CampanaBloc with Validators {
  final _userController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get userStream =>
      _userController.stream.transform(validarUsuario);

  //Registrarse
  Stream<String> get nameStream =>
      _nameController.stream.transform(validarNombre);

  Stream<bool> get formValidStream =>
      Rx.combineLatest([userStream], (p) => true);

  Stream<bool> get formValidCampanaStream =>
      Rx.combineLatest2(userStream, nameStream, (a, b) => true);
  //Insertar valores al Stream
  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changeName => _nameController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get user => _userController.value;
  String get name => _nameController.value;

  dispose() {
    _userController?.close();
    _nameController?.close();
  }
}
