import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_bloc.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_states.dart';
import 'package:spotify_prototype/presentation/widgets/search_widget.dart';
import 'package:spotify_prototype/presentation/widgets/track_widget.dart';

class SearchLayout extends StatefulWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  State<SearchLayout> createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: const [
            Text('Playlist'),
            SizedBox(width: 20),
            Expanded(child: SearchWidget()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is InitialSearchState) {
                  return const Center(
                    child: Text(
                      'Pleas, enter an artist in the input field',
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
                if (state is ErrorSearchState) return const Text('Error loading');
                if (state is SearchingState) return const Center(child: CircularProgressIndicator());
                if (state is LoadedSearchedTracksState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.playList.length,
                      itemBuilder: (_, index) => TrackWidget(trackModel: state.playList[index]),
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