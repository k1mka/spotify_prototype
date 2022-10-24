import 'package:flutter/material.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

class TrackWidget extends StatefulWidget {
  const TrackWidget({Key? key, required this.trackModel}) : super(key: key);

  final TrackModel trackModel;

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(widget.trackModel.artistsNamesFormatted),
            subtitle: Text(widget.trackModel.songName),
            trailing: const Icon(Icons.favorite_border),
            selected: true,
          ),
        ),
      ],
    );
  }
}
