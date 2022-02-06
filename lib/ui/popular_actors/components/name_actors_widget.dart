import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/ui/popular_actors/components/popularity_widget.dart';
import 'package:provider/src/provider.dart';

class NameActorsWidget extends StatelessWidget {
  final int index;
  const NameActorsWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PopularActorsProvider>();
    final actor = model.actors[index];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            actor.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          PopularityWidget(index: index),
        ],
      ),
    );
  }
}
