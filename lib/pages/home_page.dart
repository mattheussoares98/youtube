import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  List telaAtual = const [
    HomeBar(),
    EmAltaBar(),
    InscricoesBar(),
    BibliotecaBar(),
  ];

  @override
  Widget build(BuildContext context) {
    YoutubeProvider youtubeProvider = Provider.of(context, listen: true);

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
            onPressed: () {
              youtubeProvider.searchVideo('mattheus soares zagueiro');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: telaAtual[indiceAtual],
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
