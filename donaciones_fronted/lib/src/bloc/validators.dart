import 'dart:async';

class Validators {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError("Más de 6 caracteres, por favor");
    }
  });
  final validarUsuario =
      StreamTransformer<String, String>.fromHandlers(handleData: (user, sink) {
    if (user.length >= 4) {
      sink.add(user);
    } else {
      sink.addError("El usuario debe de tener más de 4 caracteres, por favor");
    }
  });

  final validarCorreo = StreamTransformer<String, String>.fromHandlers(
      handleData: (correo, sink) {
    if (correo.length >= 6) {
      sink.add(correo);
    } else {
      sink.addError("Más de 6 caracteres, por favor para el correo");
    }
  });
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    if (nombre.length >= 2) {
      sink.add(nombre);
    } else {
      sink.addError("Más de 2 caracteres, por favor para el nombre");
    }
  });

  final validarApellido = StreamTransformer<String, String>.fromHandlers(
      handleData: (apellido, sink) {
    if (apellido.length >= 2) {
      sink.add(apellido);
    } else {
      sink.addError("Más de 2 caracteres, por favor para el apellido");
    }
  });
  final validarTelefono = StreamTransformer<String, String>.fromHandlers(
      handleData: (telefono, sink) {
    if (telefono.length == 10) {
      sink.add(telefono);
    } else {
      sink.addError("Solo 10 caracteres, por favor para el telefono");
    }
  });
}
