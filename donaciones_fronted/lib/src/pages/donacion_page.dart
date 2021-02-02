import 'package:donaciones_fronted/src/models/donacion_model.dart';
import 'package:donaciones_fronted/src/providers/donacion_provider.dart';
import 'package:flutter/material.dart';

class DonacionPage extends StatefulWidget {
  @override
  _DonacionPageState createState() => _DonacionPageState();
}

class _DonacionPageState extends State<DonacionPage> {
  final formKey = GlobalKey<FormState>();

  DonacionModel donacion = new DonacionModel();
  final donacionProvider = new DonacionProvider();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Haz tu donación",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              _crearCategoria(),
              _crearMetodo(),
              _crearObservacion(),
              _crearBoton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearCategoria() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Categoria'),
      onSaved: (value) => donacion.categoria,
      validator: (value) {
        if (value.length < 6) {
          return "Ingrese el nombre de la categoria";
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearMetodo() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Metodo'),
      onSaved: (value) => donacion.metodo,
      validator: (value) {
        if (value.length < 6) {
          return "Ingrese el nombre del metodo";
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearObservacion() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Observación'),
      onSaved: (value) => donacion.observacion,
      validator: (value) {
        if (value.length < 6) {
          return "Ingrese el nombre de la observación";
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      label: Text("Guardar"),
      icon: Icon(Icons.save),
      onPressed: () {},
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
    print("Todo OK!");
    // donacionProvider.crearDonacion(donacion);
  }
}
