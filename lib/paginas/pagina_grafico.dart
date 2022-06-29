import 'package:flutter/material.dart';
import 'package:untitled10/directorio/leer_webservice.dart';
import 'package:untitled10/modelo/ciudad.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:untitled10/modelo/product_category.dart';

import 'menu_drawer.dart';

class PaginaGrafico extends StatefulWidget {
  const PaginaGrafico({Key? key}) : super(key: key);

  @override
  _PaginaGraficoState createState() => _PaginaGraficoState();
}

class _PaginaGraficoState extends State<PaginaGrafico> {
  List<charts.Series<Ciudad, String>> valores = [];
  List<charts.Series<ProductCategory, String>> valoresProdCat = [];

  @override
  void initState() {
    super.initState();
    leerValores();
    leerValoresProdCat();
  }

  void leerValores() async {
    List<charts.Series<Ciudad, String>> tmp = await _createSampleData();
    setState(() {
      valores = tmp;
    });
  }
  void leerValoresProdCat() async {
    List<charts.Series<ProductCategory, String>> tmp = await _crearProdCatDatos();
    setState(() {
      valoresProdCat = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("grafico")),
        drawer: MenuDrawer(),
        body: Column(
          children: [
            Text("grafico"),
            SizedBox(
              height: 200,
              child: charts.BarChart(
                valores,
                animate: true,
              ),
            ),
            SizedBox(
              height: 200,
              child: charts.BarChart(
                valoresProdCat,
                animate: true,
              ),
            )
          ],
        ));
  }

  /// Create one series with sample hard coded data.
  static Future<List<charts.Series<Ciudad, String>>> _createSampleData() async {
    //  final data = [] await LeerWebService.listar();
    final List<Ciudad> data = await LeerWebService.listar();
    return [
      charts.Series<Ciudad, String>(
        id: 'Ciudad',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Ciudad ciudad, _) => ciudad.name ?? "nulo",
        measureFn: (Ciudad ciudad, _) => ciudad.idcity,
        data: data,
      )
    ];
  }
  static Future<List<charts.Series<ProductCategory, String>>> _crearProdCatDatos() async {
    //  final data = [] await LeerWebService.listar();
    final List<ProductCategory> data = await LeerWebService.listarProdCat();
    return [
      charts.Series<ProductCategory, String>(
        id: 'ProductCategory',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ProductCategory ciudad, _) => ciudad.name,
        measureFn: (ProductCategory ciudad, _) => ciudad.idProductCategory,
        data: data,
      )
    ];
  }
}
