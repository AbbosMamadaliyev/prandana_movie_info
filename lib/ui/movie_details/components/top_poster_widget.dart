import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:prandana_movie_info/ui/movie_details/components/raiting_and_play_button.dart';
import 'package:provider/src/provider.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final movieDetails = context.watch<MovieDetailsProvider>().details;
    final backdropPath = movieDetails?.backdrop_path;
    final posterPath = movieDetails?.poster_path;

    return SizedBox(
      height: size.height * 0.45,
      child: Stack(
        children: [
          backdropPath != null
              ? AspectRatio(
                  aspectRatio: 390 / 219,
                  child: Image.network(ApiClient.imageUrl(backdropPath)))
              : const SizedBox.shrink(),
          Positioned(
            top: size.height * 0.14,
            left: size.width * 0.06,
            child: posterPath != null
                ? Image.network(
                    ApiClient.imageUrl(posterPath),
                    width: size.width * 0.36,
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            top: size.height * 0.32,
            left: size.width * 0.52,
            child: RaitingAndPlayTrailerButton(),
          ),
        ],
      ),
    );
  }
}
