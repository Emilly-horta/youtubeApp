import 'package:flutter/material.dart';
import 'package:listas/pesquisa.dart';
import 'package:listas/screens/Biblioteca.dart';
import 'package:listas/screens/Em_alta.dart';
import 'package:listas/screens/Inicio.dart';
import 'package:listas/screens/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado= "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blueGrey[300],
            ),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: Pesquisa());
              setState(() {
                _resultado = res;
              });
              //print("resultado: " + res);
            },
          ),
          /*
          IconButton(
          ),
           IconButton(
          ),
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.red[200],
              title: Text('Inicio'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              title: Text('Em alta'),
              icon: Icon(Icons.whatshot),
            ),
            BottomNavigationBarItem(
              //  backgroundColor: Colors.green[500],
              title: Text('Inscrições'),
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green[500],
              title: Text('Biblioteca'),
              icon: Icon(Icons.folder),
            ),
            //BottomNavigationBarItem(),
          ]),
    );
  }
}
