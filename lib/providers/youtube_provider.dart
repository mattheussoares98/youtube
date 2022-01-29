import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/utils/youtube_utils.dart';
import 'package:http/http.dart' as http;

class YoutubeProvider extends ChangeNotifier {
  searchVideo(String search) async {
    String _baseUrl = YoutubeUtils.youtubeUrlBase;
    String _channelId = YoutubeUtils.youtubeIdChannel;
    String _apiKey = YoutubeUtils.youtubeApiKey;

    try {
      http.Response response = await http.get(
        Uri.parse(
          '$_baseUrl/search?part=snippet&q=$search&maxResults=20&key=$_apiKey',
        ),
      );

      if (response.statusCode == 200) {
        Map responseInMap = json.decode(response.body);

        print(responseInMap['items'][0] is Map);

        //poderia ter feito usando um "for" para percorrer cada item da lista
        //e converter em um List<Video>. Porém, ia gastar muito mais memória
        //se fizesse isso porque ia criar uma instância de Video pra cada laço
        //do for. Como usou um construtor factory do Video, acabou usando
        //somente uma instância de Video pra converter os dados
        List<Video> videos = responseInMap['items'].map<Video>(
          (items) {
            return Video.fromJson(items);
          },
        ).toList();

        print(videos[0].titulo);
      } else {
        print('erro para consultar os vídeos');
        print(response.statusCode);
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Erro para realizar a consulta: $e');

      e;
    } finally {}
  }
}
