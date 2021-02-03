import 'package:donaciones_fronted/src/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  Future<Map<String, dynamic>> login(String usuario, String password) async {
    final url = 'ws';

    final resp = await http.post(url, body: usuario.toJson());

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(UsuarioModel usuario) async {
    final url = 'ws';

    final resp = await http.post(url, body: usuario.toJson());

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']};
    }
  }
}
