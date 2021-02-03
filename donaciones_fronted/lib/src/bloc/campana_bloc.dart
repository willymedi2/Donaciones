import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:donaciones_fronted/src/bloc/validators.dart';

class CampanaBloc with Validators {
  final _nameController = BehaviorSubject<String>();

  //Registrarse
  Stream<String> get nameStream =>
      _nameController.stream.transform(validarNombre);

  Stream<bool> get formValidStream =>
      Rx.combineLatest([nameStream], (p) => true);

  Stream<bool> get formValidCampanaStream =>
      Rx.combineLatest([nameStream], (a) => true);
  //Insertar valores al Stream
  Function(String) get changeName => _nameController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get name => _nameController.value;

  dispose() {
    _nameController?.close();
  }
}
