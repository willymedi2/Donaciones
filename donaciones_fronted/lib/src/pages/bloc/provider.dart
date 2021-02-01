import 'package:donaciones_fronted/src/pages/bloc/login_bloc.dart';
export 'package:donaciones_fronted/src/pages/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Providerr extends InheritedWidget {
  static Providerr _instancia;
  factory Providerr({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Providerr._internal(key: key, child: child);
    }
    return _instancia;
  }
  Providerr._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providerr>().loginBloc;
  }
}
