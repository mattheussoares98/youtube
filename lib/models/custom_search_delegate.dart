import 'package:flutter/material.dart';

//QUANDO CHAMA ESSE MÉTODO, ELE CRIA UMA NOVA TELA E É POSSÍVEL PASSAR ALGUN DADO
//PRA TELA ANTERIOR A PARTIR DO 'query'
class CustomSearchDelegate extends SearchDelegate {
  //ícone que aparecerá à direita. No caso podemos usar o clear
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; //limpa o que foi digitado na consulta
        },
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          close(context, query == null ? '' : query);
        },
      ),
    ];
  }

  //botão que vai ficar na esquerda
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          //esse método fecha a tela atual e manda pra tela anterior o que
          //for passado como parâmetro
          context,
          null,
        );
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

//trata o que vai acontecer quando clicarem no ícone de pesquisa (no teclado),
// já na tela de consulta

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

//cada vez que o usuário digita alguma coisa, chama o método a seguir
//o query armazena o que foi digitado a cada texto digitado
  @override
  Widget buildSuggestions(BuildContext context) {
    // print('resultado digitado $query');
    return Container();
  }
}
