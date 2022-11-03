import 'package:flutter/material.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

class TrackWidget extends StatefulWidget {
  const TrackWidget({Key? key, required this.trackModel, required this.onPressed}) : super(key: key);
  final TrackModel trackModel;
  final void Function(bool isLiked) onPressed;

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  var isLiked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(widget.trackModel.artistsNamesFormatted),
            subtitle: Text(widget.trackModel.songName.toString()),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: isLiked ? Colors.grey : Colors.red,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                  widget.onPressed(isLiked);
                });
              },
            ),
            selected: true,
          ),
        ),
      ],
    );
  }
}
