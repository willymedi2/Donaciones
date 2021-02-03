import 'package:donaciones_fronted/src/bloc/provider.dart';
import 'package:donaciones_fronted/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static String id = 'registro';
  @override
  Widget build(BuildContext context) {
    final bloc = Providerr.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 300.0,
                image: AssetImage(
                  'images/donaciones.png',
                ),
              ),
              Center(
                  child: Text("Registrate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0))),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(bloc),
              SizedBox(
                height: 15,
              ),
              _passwordTextField(bloc),
              SizedBox(
                height: 15.0,
              ),
              _nameTextField(bloc),
              SizedBox(
                height: 15.0,
              ),
              _apellidoTextField(bloc),
              SizedBox(
                height: 15.0,
              ),
              _correoTextField(bloc),
              SizedBox(
                height: 15.0,
              ),
              _telefonoTextField(bloc),
              SizedBox(
                height: 15.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bottonLogin(bloc, context),
                  FlatButton(
                    child: Text("Ya tienes cuenta? Inicia Sesión"),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, "login_page"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _telefonoTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.telefonoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.call),
                  hintText: 'telefono',
                  labelText: "Telefono",
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeTelefono(value),
            ),
          );
        });
  }

  Widget _correoTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.correoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'correo',
                  labelText: "Correo",
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeCorreo(value),
            ),
          );
        });
  }

  Widget _apellidoTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.apellidoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.supervised_user_circle),
                  hintText: 'apellido',
                  labelText: "Apellido",
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeApellido(value),
            ),
          );
        });
  }

  Widget _nameTextField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.nameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'nombre',
                  labelText: "Nombre",
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeName(value),
            ),
          );
        });
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
                "Registrarse",
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
