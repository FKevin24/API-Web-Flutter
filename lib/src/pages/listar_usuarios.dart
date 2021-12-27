import 'package:flutter/material.dart';

import 'detalles_usuario.dart';

class ElementoLista extends StatelessWidget {
  final lista;

  ElementoLista({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetallesUsuario(
                  index: posicion,
                  lista: lista,
                ),
              ));
            },
            child: new Card(
              color: Colors.cyan,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.supervised_user_circle),
                    Text(
                      lista[posicion]['id'] + ": " + lista[posicion]['nombre'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                )
                
              ),
            ),
          ),
        );
      },
    );
  }
}
