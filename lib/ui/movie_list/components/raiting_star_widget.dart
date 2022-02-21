import 'package:flutter/material.dart';
import 'package:prandana_movie_info/view_models/movie_list_provider/movie_list_provider.dart';
import 'package:provider/src/provider.dart';

class RaitingStarWidget extends StatelessWidget {
  final int index;
  const RaitingStarWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListProvider>();
    final movie = model.movies[index];

    return SizedBox(
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.orangeAccent,
            ),
            const SizedBox(width: 6),
            Text(
              movie.voteAverage.toString(),
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      height: 30,
    );
  }
}
