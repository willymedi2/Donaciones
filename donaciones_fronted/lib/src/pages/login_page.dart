import 'package:donaciones_fronted/src/pages/bloc/provider.dart';
import 'package:donaciones_fronted/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String id = 'login_page';
  @override
  Widget build(BuildContext context) {
    final bloc = Providerr.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'images/donaciones.png',
                  height: 300.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(bloc),
              SizedBox(
                height: 15,
              ),
              _passwordTextField(bloc),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(bloc, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.userStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.supervised_user_circle),
                  hintText: 'usuario',
                  labelText: "Nombre de Usuario",
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeUser(value),
            ),
          );
        });
  }

  Widget _passwordTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Contraseña',
                  labelText: "Contraseña",
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changePassword(value),
            ),
          );
        });
  }

  Widget _bottonLogin(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 10.0,
            color: Colors.yellow,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print("====================");
    print("Email: ${bloc.user}");
    print("Password: ${bloc.password}");
    print("====================");

    Navigator.pushReplacementNamed(context, HomePage.id);
  }
}
