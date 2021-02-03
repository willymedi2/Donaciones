import 'package:donaciones_fronted/src//bloc/login_bloc.dart';
export 'package:donaciones_fronted/src//bloc/login_bloc.dart';
import 'package:donaciones_fronted/src//bloc/campana_bloc.dart';
export 'package:donaciones_fronted/src//bloc/campana_bloc.dart';
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
  final campanaBloc = CampanaBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providerr>().loginBloc;
  }

  static CampanaBloc ofCampana(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providerr>().campanaBloc;
  }
}
