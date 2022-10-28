import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_states.dsrt.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favourite_bloc.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

class FavoriteLayout extends StatelessWidget {
  const FavoriteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likest'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<FavoriteBloc, FavouriteStates>(
              builder: (BuildContext context, state) {
                if (state is InitialState) return const Text('EXPECTATION');
                if (state is LoadingFavorite) return const CircularProgressIndicator();
                if (state is ErrorFavorite) return const Text('unhandled exception in FavoriteLayout');
                if (state is LoadedFavorite) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.favoriteList.length,
                      itemBuilder: (_, index) => TrackWidget(
                        trackModel: state.favoriteList[index],
                      ),
                    ),
                  );
                }
                throw Exception('unprocessed state $state in FavouriteLayout');
              },
            ),
          ),
        ],
      ),
    );
  }
}
