import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_states.dart';

class PlayListBloc extends Bloc<TrackEvent, PlayListState> {
  final Repository repository;

  PlayListBloc(this.repository) : super(InitialState()) {
    on<SearchTrackEvent>((event, emit) async {
      try {
        emit(LoadingTrack());
        final List<TrackModel> tracks = await repository.fetchTrack(search: event.search, limit: event.limit);
        emit(LoadedTrack(tracks));
      } catch (e) {
        emit(ErrorTrack(e));
      }
    });
  }
}
