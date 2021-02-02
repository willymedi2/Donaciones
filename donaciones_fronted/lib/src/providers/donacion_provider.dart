import 'dart:convert';

import 'package:donaciones_fronted/src/models/donacion_model.dart';
import 'package:http/http.dart' as http;

class DonacionProvider {
  final String _url = '';

  Future<bool> crearDonacion(DonacionModel donacion) async {
    final url = '';
    final resp = await http.post(url, body: donacion.toJson());
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }
}
