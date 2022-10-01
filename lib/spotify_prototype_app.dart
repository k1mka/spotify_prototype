import 'package:flutter/material.dart';

import 'presentation/screens/playlist_screen.dart';

class SpotifyPrototypeApp extends StatelessWidget {
  const SpotifyPrototypeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlayListScreen(),
    );
  }
}
