import 'package:flutter/material.dart';
import 'package:untitled10/paginas/pagina_grafico.dart';
import 'package:untitled10/paginas/pagina_inicial.dart';

class MenuDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuDrawer();
  }
}
class _MenuDrawer extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Pagina Inicial'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaInicial()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Pagina Grafico'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginaGrafico()),
              );
              // ...
            },
          ),
        ],
      ),
    );
  }

}