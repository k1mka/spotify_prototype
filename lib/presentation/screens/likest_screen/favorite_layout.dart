import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_states.dsrt.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favourite_bloc.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

import 'bloc/favorite_events.dart';

class FavoriteLayout extends StatefulWidget {
  const FavoriteLayout({Key? key}) : super(key: key);

  @override
  State<FavoriteLayout> createState() => _FavoriteLayoutState();
}

class _FavoriteLayoutState extends State<FavoriteLayout> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(LoadFavoriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likest'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          BlocBuilder<FavoriteBloc, FavouriteState>(
            builder: (BuildContext context, state) {
              if (state is InitialFavoriteState) return const Text('EXPECTATION');
              if (state is LoadingFavoriteState) return const CircularProgressIndicator();
              if (state is ErrorFavoriteState) return const Text('unhandled exception in FavoriteLayout');
              if (state is LoadedFavoriteState) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.favoriteList.length,
                    itemBuilder: (_, index) => TrackWidget(trackModel: state.favoriteList[index]),
                  ),
                );
              }
              throw Exception('unprocessed state $state in FavouriteLayout');
            },
          ),
        ],
      ),
    );
  }
}
