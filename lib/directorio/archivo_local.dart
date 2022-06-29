import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ArchivoLocal {
  /// leer la ruta local
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// obtener el archivo
  static Future<File> _localFile(String archivo) async {
    final path = await _localPath;
    // c:/temp/counter.txt
    return File('$path/$archivo.txt');
  }

  static Future<File> writer(String contenido,String archivo) async {
    final file = await _localFile(archivo);

    // Write the file
    return file.writeAsString(contenido);
  }

  static Future<String> read(String archivo) async {
    try {
      final file = await _localFile(archivo);

      // Read the file
      final contents = await file.readAsString();

      return(contents);
    } catch (e) {
      return "[]";
    }
  }
}
