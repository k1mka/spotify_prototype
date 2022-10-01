import 'package:flutter/material.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

class TrackWidget extends StatelessWidget {
  const TrackWidget({Key? key, required this.trackModel}) : super(key: key);

  final TrackModel trackModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(trackModel.trackImage),
      ),
    );
  }
}
