import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

class TrackWidget extends StatefulWidget {
  const TrackWidget({Key? key, required this.trackModel}) : super(key: key);

  final TrackModel trackModel;

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  static const likedKey = 'liked_key';
  bool liked = false;

  @override
  void initState() {
    _restorePersistedPreferences();
    super.initState();
  }

  void _restorePersistedPreferences() async {
    var preferences = await SharedPreferences.getInstance();
    var liked = preferences.getBool(likedKey);
    setState(() {
      this.liked = liked!;
    });
  }

  void _persistPreferences() async {
    setState(() => liked = !liked);
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(likedKey, liked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(widget.trackModel.artistsNamesFormatted),
            subtitle: Text(widget.trackModel.songName),
            trailing: IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                _persistPreferences();
              },
            ),
            selected: true,
          ),
        ),
      ],
    );
  }
}
