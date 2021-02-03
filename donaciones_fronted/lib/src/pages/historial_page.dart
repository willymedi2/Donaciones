import 'package:donaciones_fronted/src/models/donacion_model.dart';
import 'package:donaciones_fronted/src/providers/donacion_provider.dart';
import 'package:flutter/material.dart';

class HistorialPage extends StatelessWidget {
  final donacionProvider = new DonacionProvider();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: donacionProvider.cargarDonaciones(),
      builder:
          (BuildContext context, AsyncSnapshot<List<DonacionModel>> snapshot) {
        if (snapshot.hasData) {
          final donaciones = snapshot.data;
          return ListView.builder(
            itemCount: donaciones.length,
            itemBuilder: (context, i) => _crearItem(donaciones[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget _crearItem(DonacionModel donacion) {
    return ListTile(
      title: Text(donacion.metodo),
      subtitle: Text(donacion.observacion),
    );
  }
}
