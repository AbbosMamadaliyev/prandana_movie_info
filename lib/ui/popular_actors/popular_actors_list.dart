import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/api_client/api_client.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/ui/popular_actors/components/name_actors_widget.dart';
import 'package:prandana_movie_info/ui/popular_actors/components/search_actor_widget.dart';
import 'package:provider/src/provider.dart';

import '../../main_navigation.dart';
import 'components/custom_card_widget.dart';

class ActorInfoWidget extends StatelessWidget {
  final String locale;
  const ActorInfoWidget({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final model = context.watch<PopularActorsProvider>();

    return Stack(
      children: [
        model.actors.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: height * 0.1),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: model.actors.length,
                itemExtent: 163,
                itemBuilder: (BuildContext context, int index) {
                  // keyingi page ochilishi
                  model.showActorAtIndex(index);

                  final actor = model.actors[index];
                  final profilePath = actor.profile_path;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: Stack(
                      children: [
                        CustomCardActorsInfoWidget(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  profilePath != null
                                      ? Image.network(
                                          ApiClient.imageUrl(profilePath),
                                          width: 95,
                                          fit: BoxFit.cover,
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(width: 15),
                                  NameActorsWidget(index: index),
                                  const SizedBox(width: 12),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                MainNavigationRouteNames.castingMovies,
                                arguments: {'index': index, 'locale': locale},
                              );
                            },
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        const SearchActorWidget(),
      ],
    );
  }
}
