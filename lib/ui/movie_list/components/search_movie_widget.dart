import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_list_provider/movie_list_provider.dart';
import 'package:provider/src/provider.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListProvider>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: model.searchMovie,
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
