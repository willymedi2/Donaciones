import 'package:donaciones_fronted/src/models/camapana_model.dart';

class CampanaProvider {
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
}
