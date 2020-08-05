import 'package:flutter/material.dart';

class Pesquisa extends SearchDelegate<String> {
  @override
  //define as ações
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            //showSearch(context: context, delegate: null);
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = List();

    if (query.isNotEmpty) {
      lista = ["Android", "Android Navigator", "IOS", "Jogos"].where((texto) => texto.toLowerCase().startsWith(query.toLowerCase())).toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("nenhum resultado"),
      );
    }
  }
}
