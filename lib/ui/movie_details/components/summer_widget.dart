import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:provider/src/provider.dart';

class SummerWidget extends StatelessWidget {
  const SummerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;
    final runTime = movieDetails?.runtime;

    var genresName = <String>[];
    final genres = movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      for (var genr in genres) {
        genresName.add(genr.name);
      }
    }

    final productCountries = movieDetails?.production_countries;
    var productCntrName = <String>[];
    if (productCountries != null && productCountries.isNotEmpty) {
      for (var productCntr in productCountries) {
        productCntrName.add(productCntr.name);
      }
    }
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Text(
          'Длительность: $runTime м  '
          '\nЖанр: ${genresName.join(', ')}  '
          '\nСтраны производства:  ${productCntrName.join(', ')}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
