import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_states.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/traclist_bloc.dart';

class PlaylistLayout extends StatefulWidget {
  const PlaylistLayout({Key? key}) : super(key: key);

  @override
  State<PlaylistLayout> createState() => _PlaylistLayoutState();
}

class _PlaylistLayoutState extends State<PlaylistLayout> {
  @override
  void initState() {
    super.initState();
    context.read<PLayListBloc>().add(LoadingTrackEvent());
  }

  Widget build(BuildContext context) {
    return BlocBuilder<PLayListBloc, PlayListState>(
      builder: (context, state) {
        //TODO : connect state and events
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Playlist'),
          ),
          body: Center(),
        );
      },
    );
  }
}
