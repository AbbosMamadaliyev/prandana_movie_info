// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:provider/src/provider.dart';

import 'movie_details_main_info_widget.dart';
import 'movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _TitleWidget(),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(24, 23, 45, 1.0),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: MovieDetailsBody(),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;

    return Text(
      movieDetails?.title ?? 'Загрузка...',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailsProvider>().details;
    if (movieDetails == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView(
      children: [
        MovieDetailsMainInfoWidget(),
        SizedBox(height: 30),
        MovieDetailsMainScreenCastWidget(),
      ],
    );
  }
}
