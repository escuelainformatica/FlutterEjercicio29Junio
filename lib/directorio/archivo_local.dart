import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ArchivoLocal {
  /// leer la ruta local
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// obtener el archivo
  static Future<File> get _localFile async {
    final path = await _localPath;
    // c:/temp/counter.txt
    return File('$path/counter.txt');
  }

  static Future<File> writer(String contenido) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(contenido);
  }

  static Future<String> read() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return(contents);
    } catch (e) {
      return "[]";
    }
  }
}
