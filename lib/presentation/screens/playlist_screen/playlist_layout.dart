import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_states.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/traclist_bloc.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Playlist'),
      ),
      body: Center(
        child: BlocBuilder<PLayListBloc, PlayListState>(
          builder: (context, state) {
            if (state is InitialState) return const Center(child: Text('expectation'));
            if (state is ErrorTrack) return const Text('Error loading');
            if (state is LoadingTrack) return const Center(child: CircularProgressIndicator());
            if (state is LoadedTrack) {
              return ListView.separated(
                itemBuilder: (_, __) => const Divider(thickness: 4),
                separatorBuilder: (__, index) => TrackWidget(trackModel: state.playList[index]),
                itemCount: state.playList.length,
              );
            }
            throw Exception('Not processed state in PlayListLayout');
          },
        ),
      ),
    );
  }
}
