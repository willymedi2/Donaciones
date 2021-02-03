import 'dart:convert';

import 'package:donaciones_fronted/src/models/donacion_model.dart';
import 'package:http/http.dart' as http;

class DonacionProvider {
  // final String _url = '';

  Future<bool> crearDonacion(DonacionModel donacion) async {
    final url = '';
    final resp = await http.post(url, body: donacion.toJson());
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<List<DonacionModel>> cargarDonaciones() async {
    final url = "http://192.168.0.108:8000/donaciones/";
    final resp = await http.get(url);

    final List<String, dynamic> decodedData = json.decode(resp.body);
    final List<DonacionModel> donaciones = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, dona) {
      final donaTemp = DonacionModel.fromJson(dona);
      donaciones.add(donaTemp);
    });

    print(decodedData);
    return donaciones;
  }
}
