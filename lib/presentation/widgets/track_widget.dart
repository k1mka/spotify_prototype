import 'package:flutter/material.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

class TrackWidget extends StatelessWidget {
  const TrackWidget({Key? key, required this.trackModel}) : super(key: key);

  final TrackModel trackModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(trackModel.artistName),
            subtitle: Text(trackModel.songName),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(trackModel.trackImage),
            ),
          ),
        ),
      ],
    );
  }
}
