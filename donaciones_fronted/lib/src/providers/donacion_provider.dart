import 'dart:convert';

import 'package:donaciones_fronted/src/models/donacion_model.dart';
import 'package:http/http.dart' as http;

class DonacionProvider {
  final String url = 'http://192.0.2.2:8000/donaciones/';
  final String url2 = 'http://192.168.0.108:8000/donaciones/';

  Future<bool> crearDonacion(DonacionModel donacion) async {
    //final url = '';
    print(donacion.toJson());
    final resp = await http.post(url2, body: donacion.toJson());
    final decodeData = json.decode(resp.body);
    print("aqui");
    print(decodeData);

    return true;
  }

  Future<List<DonacionModel>> cargarDonaciones() async {
    //final url = "";
    final resp = await http.get(url2);

    // print(resp.body);

    final List<dynamic> decodedData = json.decode(resp.body);
    final List<DonacionModel> donaciones = new List();

    if (decodedData == null) return [];

    decodedData.forEach((dona) {
      final donaTemp = DonacionModel.fromJson(dona);
      donaciones.add(donaTemp);
    });

    // print(decodedData);
    return donaciones;
  }
}
