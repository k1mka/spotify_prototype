import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/favorite_screen/bloc/favorite_states.dart';
import 'package:spotify_prototype/presentation/screens/favorite_screen/bloc/favourite_bloc.dart';
import 'package:spotify_prototype/presentation/widgets/liked_track_widget.dart';
import 'package:spotify_prototype/presentation/widgets/refresh_widget.dart';

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

  Future loadList() async {
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      return context.read<FavoriteBloc>().add(LoadFavoriteEvent());
    });
  }

  // todo: implements pull to refresh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: loadList, icon: const Icon(Icons.refresh))],
        title: const Text('Favorite'),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (BuildContext context, state) {
          if (state is InitialFavoriteState) return const Text('EXPECTATION');
          if (state is LoadingFavoriteState) return const CircularProgressIndicator();
          if (state is ErrorFavoriteState) return Text('unhandled exception in FavoriteLayout ${state.exception}');
          if (state is LoadedFavoriteState) {
            if (state.favoriteList.isEmpty) return const Center(child: Text('No favorite track'));
            return RefreshWidget(
              onRefresh: () {
                return loadList();
              },
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: state.favoriteList.length,
                itemBuilder: (_, index) => LikedTrackWidget(
                  trackModel: state.favoriteList[index],
                  onPressed: () {
                    setState(
                      () {
                        // state.favoriteList.remove(state.favoriteList[index]);
                        context.read<FavoriteBloc>().add(DeleteFavoriteEvent(state.favoriteList[index]));
                      },
                    );
                  },
                ),
              ),
            );
          }
          throw Exception('unprocessed state $state in FavouriteLayout');
        },
      ),
    );
  }
}
