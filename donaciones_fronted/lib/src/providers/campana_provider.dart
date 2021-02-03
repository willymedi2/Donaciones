import 'package:donaciones_fronted/src/models/camapana_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CampanaProvider {
  final String url = 'http://192.168.0.108:8000/campana/';
  List<CamapanaModel> lista = new List();

  List<CamapanaModel> agregarCampanas() {
    CamapanaModel campana1 = new CamapanaModel();
    CamapanaModel campana2 = new CamapanaModel();
    CamapanaModel campana3 = new CamapanaModel();
    campana1.id = 0;
    campana2.id = 1;
    campana3.id = 2;
    campana1.nombre = "Campaña 1";
    campana2.nombre = "Campaña 2";
    campana3.nombre = "Campaña 3";
    List<CamapanaModel> lista = new List();
    lista.add(campana1);
    lista.add(campana2);
    lista.add(campana3);
    return lista;
  }

  Future<bool> crearCampana(CamapanaModel campana) async {
    //final url = '';
    final resp = await http.post(url, body: campana.toJson());
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<List<CamapanaModel>> cargarCampanas() async {
    //final url = "";
    final resp = await http.get(url);

    final List<dynamic> decodedData = json.decode(resp.body);
    final List<CamapanaModel> campanas = new List();

    if (decodedData == null) return [];
    print(decodedData);
    decodedData.forEach((camp) {
      final donaTemp = CamapanaModel.fromJson(camp);
      campanas.add(donaTemp);
    });
    this.lista = campanas;

    return campanas;
  }

  List<CamapanaModel> filtroCampanas(String nombre) {
    List<CamapanaModel> c = new List();
    cargarCampanas();
    this.lista.forEach((i) {
      if (i.nombre.contains(nombre)) {
        c.add(i);
      }
    });
    return c;
  }
}
