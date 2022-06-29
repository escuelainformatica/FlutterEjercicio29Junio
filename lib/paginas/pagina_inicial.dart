import 'package:flutter/material.dart';
import 'package:untitled10/directorio/leer_webservice.dart';

import '../modelo/ciudad.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {

  List<Ciudad> ciudades=[];

  @override
  void initState() {
    super.initState();
    cargarCiudades();
  }
  void cargarCiudades() async {
    List<Ciudad> tmp=await LeerWebService.listar();

    setState(() { ciudades = tmp; }); // cargar los datos y dibujar la pagina

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("conexion al web service")),
      body: ListView.builder(
        itemCount: ciudades.length,
        itemBuilder: (BuildContext, fila) {
          return Text(ciudades[fila].name??"sin nombre");
        },

      ),
    );
  }
}
