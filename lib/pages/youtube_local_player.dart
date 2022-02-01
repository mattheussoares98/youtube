import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeLocalPlayer extends StatefulWidget {
  final String videoId;
  const YoutubeLocalPlayer({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  _YoutubeLocalPlayerState createState() => _YoutubeLocalPlayerState();
}

class _YoutubeLocalPlayerState extends State<YoutubeLocalPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller!,
      showVideoProgressIndicator: true,
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
