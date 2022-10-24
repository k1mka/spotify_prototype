import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/likest_screen.dart';
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
    context.read<PlayListBloc>().add(LoadingTrackEvent('Kanye West', 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Playlist'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.red,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Playlist',
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Likest',
            icon: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LikestScreen()),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<PlayListBloc, PlayListState>(
          builder: (context, state) {
            if (state is InitialState) return const Center(child: Text('expectation'));
            if (state is ErrorTrack) return const Text('Error loading');
            if (state is LoadingTrack) return const Center(child: CircularProgressIndicator());
            if (state is LoadedTrack) {
              return ListView.builder(
                itemBuilder: (_, index) => TrackWidget(trackModel: state.playList[index]),
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
