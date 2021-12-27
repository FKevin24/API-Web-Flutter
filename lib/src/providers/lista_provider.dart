import 'package:api_web/src/pages/agregar_usuario.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'usuarios.dart';

import 'package:http/http.dart' as http;

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {

  List<DatosUsuarios> data = <DatosUsuarios>[];

  Future<List<DatosUsuarios>> obtenerUsuarios() async {
    var response = await http
        .get(Uri.parse("https://marcaweb.net/pruebas/api.php"))
        .timeout(Duration(seconds: 5));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    obtenerUsuarios().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE USUARIOS"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.red, width: 2),
                    )
                  ),
                  child: Column(
                    children: [
                      Text(
                        data[index].nombre, style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        data[index].apellido, style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AgregarUsuario(),
        )),
      ),
    );
  }
}