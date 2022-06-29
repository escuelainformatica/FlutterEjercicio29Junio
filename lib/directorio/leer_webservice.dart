import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:untitled10/directorio/archivo_local.dart';

import '../modelo/ciudad.dart';

class LeerWebService {

  /// 1) intenta leer el web service.
  /// 2) si puede leer, guardar los datos localmente
  /// 2.1) y lo convierte en una lista de dinamico
  /// 2.2) y la lista de dinamico la transforma en una lista de ciudad
  /// 3) si no puede leer (error del codigo no es 200, o que se genera una excepcion)
  /// 3.1) leer los datos locales
  /// 3.2) los transforma en una lista de dinamico
  /// 3.3) la lista de dinamico la transfforma en una lista de ciudad.
  static Future<List<Ciudad>> listar() async {
    List<Ciudad> resultado=[];
    try {
      var url =
      Uri.http('158.101.30.194', '/testcli/examples/oraclevm2/City/listall', {});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        ArchivoLocal.writer(response.body);
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        resultado = jsonResponse.map((e) => Ciudad.fromJson(e)).toList();
      } else {
        String contenido = await ArchivoLocal.read();
        var jsonResponse = convert.jsonDecode(contenido) as List<dynamic>;
        resultado = jsonResponse.map((e) => Ciudad.fromJson(e)).toList();
      }
    } on Exception catch (_) {
      String contenido = await ArchivoLocal.read();
      var jsonResponse = convert.jsonDecode(contenido) as List<dynamic>;
      resultado = jsonResponse.map((e) => Ciudad.fromJson(e)).toList();
    }
    return resultado;
  }
}