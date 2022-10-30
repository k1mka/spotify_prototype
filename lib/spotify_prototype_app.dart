import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/favorite_screen.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/search_screen.dart';

class SpotifyPrototypeApp extends StatelessWidget {
  const SpotifyPrototypeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        Expanded(
          child: PersistentTabView(
            context,
            screens: const [
              PlayListScreen(),
              FavouriteScreen(),
            ],
            items: navBarItems(),
          ),
        ),
      ]),
    );
  }
}

List<PersistentBottomNavBarItem> navBarItems() => [
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.green,
          ),
          title: 'Playlist'),
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.favorite,
            color: Colors.green,
          ),
          title: 'FavouriteList')
    ];
