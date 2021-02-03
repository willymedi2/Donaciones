import 'package:donaciones_fronted/src/bloc/provider.dart';
import 'package:donaciones_fronted/src//bloc/campana_bloc.dart';
import 'package:donaciones_fronted/src/providers/campana_provider.dart';
import 'package:flutter/material.dart';
//import 'package:line_awesome_icons/line_awesome_icons.dart';

class CampanaPage extends StatefulWidget {
  static String id = 'registro';

  @override
  _CampanaPageState createState() => _CampanaPageState();
}

class _CampanaPageState extends State<CampanaPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Providerr.ofCampana(context);
    CampanaProvider c = new CampanaProvider();
    print(c.cargarCampanas());
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image(
            alignment: Alignment.topCenter,
            image: AssetImage("images/charity.png"),
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Positioned(
            top: 40,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "Campañas",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'CentraleSansRegular'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Ultimas Campañas",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110),
            height: 300,
            width: 450,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //Aqui deberian ir las fotos de las campanias
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 370),
            height: 400,
            width: 400,
            child: ListView(
              children: <Widget>[
                //aqui irian todas las campanias y los filtros de las mismas

                Center(
                    child: Text("Crear Campana",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0))),
                SizedBox(
                  height: 15.0,
                ),
                _nameTextField(bloc),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _bottonLogin(bloc, context),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _nameTextField(CampanaBloc bloc) {
  return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.campaign),
                hintText: 'nombre',
                labelText: "Nombre",
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) => bloc.changeName(value),
          ),
        );
      });
}

Widget _bottonLogin(CampanaBloc bloc, BuildContext context) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              "Crear",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 10.0,
          color: Colors.yellow,
          onPressed:
              snapshot.hasData ? () => _postCampana(bloc, context) : null);
    },
  );
}

_postCampana(CampanaBloc bloc, BuildContext context) {
  print("====================");
  print("Nombre Campana: ${bloc.name}");
  print("====================");
}
