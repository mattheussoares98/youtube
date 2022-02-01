import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/pages/youtube_local_player.dart';
import 'package:youtube/providers/youtube_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeBar extends StatefulWidget {
  final String search;
  const HomeBar({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    Future<List<Video>> _searchVideos() async {
      YoutubeProvider youtubeProvider = Provider.of(context);

      return await youtubeProvider.searchVideo(search: widget.search);
    }

    return FutureBuilder<List<Video>>(
      future: _searchVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:

          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black,
                    height: 5,
                  );
                },
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return YoutubeLocalPlayer(
                              videoId: videos![index].id!,
                            );
                          }),
                        );
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                videos![index].imagem!,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(videos[index].titulo!),
                          subtitle: Text(videos[index].descricao!),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              const Text('Não há dados a serem carregados');
            }
            break;
        }
        return Text('');
      },
    );
  }
}
