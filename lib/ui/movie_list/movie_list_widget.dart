import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';
import 'package:prandana_movie_info/services/credits_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/keywords_movies/keywords_movies.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:prandana_movie_info/services/movie_list_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/videos_provider/videos_provider.dart';
import 'package:prandana_movie_info/ui/movie_list/components/title_and_realese_widget.dart';
import 'package:provider/src/provider.dart';

import '../../main_navigation.dart';
import 'components/custom_card_widget.dart';
import 'components/search_movie_widget.dart';

class MovieListWidget extends StatelessWidget {
  final String locale;
  const MovieListWidget({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final model = context.watch<MovieListProvider>();

    return Stack(
      children: [
        model.movies.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: height * 0.1),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: model.movies.length,
                itemExtent: 163,
                itemBuilder: (BuildContext context, int index) {
                  // keyingi page ochilishi
                  model.showMovieAtIndex(index);

                  final movie = model.movies[index];
                  final posterPath = movie.posterPath;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: Stack(
                      children: [
                        CustomCardWidget(
                          child: Row(
                            children: [
                              posterPath != null
                                  ? Image.network(
                                      ApiClient.imageUrl(posterPath),
                                      width: 95,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(width: 15),
                              TitleAndRealeseWidget(index: index),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              print(movie.id);
                              context
                                  .read<MovieDetailsProvider>()
                                  .getDetails(movie.id, locale);
                              context
                                  .read<KeywordsProvider>()
                                  .getKeywords(movie.id);
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
                              // model.onMovieTap(context, index);
                            },
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        const SearchMovieWidget(),
      ],
    );
  }
}
