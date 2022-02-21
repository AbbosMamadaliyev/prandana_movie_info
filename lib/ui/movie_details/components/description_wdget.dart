import 'package:flutter/material.dart';
import 'package:prandana_movie_info/view_models/movie_deails_provider/movie_details_provider.dart';
import 'package:provider/src/provider.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;

    return Text(
      movieDetails?.overview ?? '[пусто]',
      style: const TextStyle(
        height: 1.3,
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
