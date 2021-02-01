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
}
