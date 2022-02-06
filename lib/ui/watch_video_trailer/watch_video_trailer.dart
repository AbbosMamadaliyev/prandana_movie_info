import 'package:flutter/material.dart';
import 'package:prandana_movie_info/models/videos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerWidget extends StatefulWidget {
  final List<Results> resultList;

  const WatchTrailerWidget({Key? key, required this.resultList})
      : super(key: key);

  @override
  State<WatchTrailerWidget> createState() => _WatchTrailerWidgetState();
}

class _WatchTrailerWidgetState extends State<WatchTrailerWidget> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.resultList[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 25, 1.0),
      appBar: AppBar(
        title: const Text('Трейлер'),
        backgroundColor: const Color.fromRGBO(24, 23, 45, 1.0),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.redAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (BuildContext context, Widget player) {
          return Column(
            children: [player],
          );
        },
      ),
    );
  }
}
