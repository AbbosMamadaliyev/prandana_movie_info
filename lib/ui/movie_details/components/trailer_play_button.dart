import 'package:flutter/material.dart';
import 'package:prandana_movie_info/ui/watch_video_trailer/watch_video_trailer.dart';
import 'package:prandana_movie_info/view_models/videos_provider/videos_provider.dart';
import 'package:provider/src/provider.dart';

class ShowTrailerBtn extends StatelessWidget {
  const ShowTrailerBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final results = context
        .watch<VideosProvider>()
        .videos
        ?.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');

    return results?.isNotEmpty == true
        ? TextButton(
            onPressed: () {
              print('result: ${results?.length}');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return WatchTrailerWidget(
                    resultList: results!.toList(),
                  );
                }),
              );
            },
            child: Row(
              children: const [
                Icon(Icons.play_arrow),
                Text('Смотреть трейлер'),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
