import 'package:flutter/material.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget(this.playlist, {Key? key}) : super(key: key);

  final List<TrackModel> playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.length,
      itemBuilder: (_, i) => TrackWidget(
        trackModel: playlist[i],
      ),
    );
  }
}
