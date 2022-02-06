import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:provider/src/provider.dart';

class PopularityWidget extends StatelessWidget {
  final int index;
  const PopularityWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PopularActorsProvider>();
    final actor = model.actors[index];

    return SizedBox(
      child: Text(
        'Популярность: ${actor.popularity.toString()}',
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      height: 30,
    );
  }
}
