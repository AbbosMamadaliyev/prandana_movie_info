import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';
import 'package:prandana_movie_info/services/credits_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/keywords_movies/keywords_movies.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/services/videos_provider/videos_provider.dart';
import 'package:provider/src/provider.dart';

import '../../main_navigation.dart';
import 'components/custom_card_widget.dart';

class PlayedMoviesWidget extends StatelessWidget {
  final int actorIndex;
  final String locale;
  const PlayedMoviesWidget({
    Key? key,
    required this.actorIndex,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PopularActorsProvider>();

    // roles, oynagan filmalari
    final playedMovies = model.actors[actorIndex].known_for;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 30, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 23, 55, 1.0),
        title: const Text(
          'Фильмы с участием',
        ),
      ),
      body: model.actors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: playedMovies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = playedMovies[index];
                final posterPath = movie.poster_path;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: InkWell(
                    onTap: () {
                      context
                          .read<MovieDetailsProvider>()
                          .getDetails(movie.id, locale);
                      context.read<KeywordsProvider>().getKeywords(movie.id);
                      context
                          .read<CreditsProvider>()
                          .getCredits(movie.id, locale);
                      context
                          .read<VideosProvider>()
                          .getVideos(movie.id, locale);

                      Navigator.of(context).pushNamed(
                        MainNavigationRouteNames.movieDetails,
                        arguments: movie,
                      );
                    },
                    child: CustomCardActorsInfoWidget(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              posterPath != null
                                  ? Image.network(
                                      ApiClient.imageUrl(posterPath),
                                      width: 95,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title ?? '#no title',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      'IMDb: ${movie.vote_average.toString()}/10',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              movie.overview,
                              style: const TextStyle(height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
