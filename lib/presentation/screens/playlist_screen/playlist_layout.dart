import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
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
  final controller = TextEditingController();
  String query = "";

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    context.read<PlayListBloc>().add(LoadingTrackEvent('Kanye West', 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            const Text('Playlist'),
            const SizedBox(width: 20),
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: controller.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            controller.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            BlocBuilder<PlayListBloc, PlayListState>(
              builder: (context, state) {
                if (state is InitialState) return const Center(child: Text('expectation'));
                if (state is ErrorTrack) return const Text('Error loading');
                if (state is LoadingTrack) return const Center(child: CircularProgressIndicator());
                if (state is LoadedTrack) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) => TrackWidget(trackModel: state.playList[index]),
                      itemCount: state.playList.length,
                    ),
                  );
                }
                throw Exception('Not processed state in PlayListLayout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
