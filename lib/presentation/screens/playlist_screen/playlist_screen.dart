import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/get_it.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_bloc.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/playlist_layout.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayListBloc>(
      create: (_) => PlayListBloc(getIt<Repository>()),
      child: const PlaylistLayout(),
    );
  }
}
