import 'package:flutter/material.dart';
import 'package:prandana_movie_info/ui/movie_details/components/trailer_play_button.dart';
import 'package:prandana_movie_info/view_models/movie_deails_provider/movie_details_provider.dart';
import 'package:provider/src/provider.dart';

class RaitingAndPlayTrailerButton extends StatelessWidget {
  const RaitingAndPlayTrailerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'IMDb: ${movieDetails?.vote_average}/10',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const ShowTrailerBtn(),
      ],
    );
  }
}
