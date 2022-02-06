import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:provider/src/provider.dart';

class MovieNameWidget extends StatelessWidget {
  const MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;
    final movieTitle = movieDetails?.title;
    var year = DateTime.tryParse(movieDetails!.release_date)?.year.toString();
    year = year != null ? ' ($year)' : '';
    return Center(
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: movieTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: year,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
