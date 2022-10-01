import 'package:flutter/material.dart';
import 'package:spotify_prototype/presentation/screens/playlist_layout.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return const PlaylistLayout();
  }
}
