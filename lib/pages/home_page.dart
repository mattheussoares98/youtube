import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/models/custom_search_delegate.dart';
import 'package:youtube/pages/biblioteca_bar.dart';
import 'package:youtube/pages/em_alta_bar.dart';
import 'package:youtube/pages/home_bar.dart';
import 'package:youtube/pages/inscricoes_bar.dart';
import 'package:youtube/providers/youtube_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indiceAtual = 0;

  String _search = '';

  @override
  Widget build(BuildContext context) {
    List telaAtual = [
      HomeBar(search: _search),
      const EmAltaBar(),
      const InscricoesBar(),
      const BibliotecaBar(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/images/youtube.png',
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              // youtubeProvider.searchVideo(search: 'mattheus soares zagueiro');
              String res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              setState(() {
                _search = res;
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telaAtual[indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black, //cor do texto de cada NavigationBarItem
        selectedFontSize: 13,
        onTap: (indice) {
          setState(() {
            indiceAtual = indice;
          });
        },
        //quando o tipo está fixado, o fundo do bottomNavigationBar não muda de acordo com o indice atual
        //quando o tipo está shifting, o fundo do bottomNavigationBar muda de acordo com o indice atual
        type: BottomNavigationBarType.fixed,
        currentIndex: indiceAtual,
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: 'Inscrições',
            icon: Icon(
              Icons.subscriptions_outlined,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue,
            label: 'Biblioteca',
            icon: Icon(
              Icons.folder,
            ),
          ),
        ],
      ),
    );
  }
}
