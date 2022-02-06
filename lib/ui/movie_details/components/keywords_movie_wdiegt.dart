import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/keywords_movies/keywords_movies.dart';
import 'package:provider/src/provider.dart';

class KeyWordsMovieWidget extends StatelessWidget {
  const KeyWordsMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keywords = context.watch<KeywordsProvider>().keywordMovies?.keywords;

    var keywordList = <String>[];
    if (keywords != null && keywords.isNotEmpty) {
      for (var keyword in keywords) {
        keywordList.add(keyword.name);
      }
    }
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ключевые слова:',
              style: TextStyle(color: Colors.white),
            ),
            Wrap(
              spacing: 8,
              children: List.generate(keywordList.length, (index) {
                return Chip(
                  label: Text(keywordList[index]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
