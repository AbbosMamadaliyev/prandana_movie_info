// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:prandana_movie_info/domain/dataproviders/api_client/api_client.dart';
import 'package:prandana_movie_info/view_models/credits_provider/movie_list_provider.dart';
import 'package:provider/src/provider.dart';

import 'components/custom_card_sctor_widget.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final credits = context.watch<CreditsProvider>().credits;
    final casts = credits?.cast;

    var actorsName = <String>[];
    var imgActors = <String>[];
    var characters = <String>[];

    if (casts != null && casts.isNotEmpty) {
      for (var cast in casts) {
        actorsName.add(cast.name);
        var path = cast.profile_path ?? '/2qhIDp44cAqP2clOgt2afQI07X8.jpg';
        imgActors.add(path);
        var character = cast.character;
        characters.add(character);
      }
    }
    return ColoredBox(
      color: Colors.white,
      child: ColoredBox(
        color: Color.fromRGBO(24, 23, 45, 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Актерский состав',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Scrollbar(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: casts?.length,
                  itemExtent: MediaQuery.of(context).size.width * 0.36,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCardActors(
                      child: Column(
                        children: [
                          Image.network(ApiClient.imageUrl(imgActors[index])),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  actorsName[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('В роли: ${characters[index]}'),
                                SizedBox(height: 7),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
