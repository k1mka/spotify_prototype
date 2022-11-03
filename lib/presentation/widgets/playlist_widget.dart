import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_bloc.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_events.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({required this.playlist, Key? key}) : super(key: key);

  final List<TrackModel> playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.length,
      itemBuilder: (_, i) => TrackWidget(
        trackModel: playlist[i],
        onPressed: (bool isLiked) {
          !isLiked
              ? context.read<SearchBloc>().add(LikeTrackEvent(playlist[i]))
              : context.read<SearchBloc>().add(DeleteFavoriteEvent(playlist[i]));
        },
      ),
    );
  }
}
