import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_list_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/ui/movie_list/components/raiting_star_widget.dart';
import 'package:provider/src/provider.dart';

class TitleAndRealeseWidget extends StatelessWidget {
  final int index;
  const TitleAndRealeseWidget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListProvider>();
    final movie = model.movies[index];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            'Релиз: ${model.stringFormatDate(movie.releaseDate)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            movie.overview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          RaitingStarWidget(index: index),
        ],
      ),
    );
  }
}
