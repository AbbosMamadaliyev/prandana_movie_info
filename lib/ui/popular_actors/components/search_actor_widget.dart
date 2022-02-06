import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:provider/src/provider.dart';

class SearchActorWidget extends StatelessWidget {
  const SearchActorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PopularActorsProvider>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: model.searchActor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          hintText: 'Найти',
          fillColor: Colors.white.withAlpha(220),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
