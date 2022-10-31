import 'package:flutter/material.dart';

import 'package:spotify_prototype/data/models/track_model.dart';

class LikedTrackWidget extends StatefulWidget {
  const LikedTrackWidget({Key? key, required this.trackModel, required this.onPressed}) : super(key: key);
  final TrackModel trackModel;
  final VoidCallback onPressed;

  @override
  State<LikedTrackWidget> createState() => _LikedTrackWidgetState();
}

class _LikedTrackWidgetState extends State<LikedTrackWidget> {
  var isDeleted = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(widget.trackModel.artistsNamesFormatted),
            subtitle: Text(widget.trackModel.songName.toString()),
            selected: true,
            trailing: IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
