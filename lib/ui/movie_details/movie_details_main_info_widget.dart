// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'components/description_wdget.dart';
import 'components/keywords_movie_wdiegt.dart';
import 'components/movie_name_widget.dart';
import 'components/summer_widget.dart';
import 'components/top_poster_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: MovieNameWidget(),
        ),
        SummerWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DescriptionWidget(),
        ),
        SizedBox(height: 12),
        KeyWordsMovieWidget(),
        SizedBox(height: 12),
        // _PeopleWidget(),
      ],
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Обзор',
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400);
    final jobTitleStyle = TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steffano Sollima1',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steffano Sollima2',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steffano Sollima3',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steffano Sollima4',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
