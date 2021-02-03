import 'package:donaciones_fronted/providers/ui_provider.dart';
import 'package:donaciones_fronted/src/models/camapana_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampanaShowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return campanaWidget(new CamapanaModel());
  }

  Widget campanaWidget(CamapanaModel c) {
    return ListTile(
        leading: Image.asset('images/campana.png'),
        title: Text(c.toJson()['nombre'],
            style: TextStyle(
                fontFamily: "CentraleSansRegular",
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Campaña",
            style: TextStyle(
              fontFamily: "CentraleSansRegular",
              fontSize: 15,
            )));
  }
}
