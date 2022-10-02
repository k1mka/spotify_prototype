import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_states.dart';

class PLayListBloc extends Bloc<TrackEvent, PlayListState> {
  Repository repository;
  PLayListBloc(this.repository) : super(InitialState()) {
    on<LoadingTrackEvent>((event, emit) async {
      emit(LoadingTrack());
      emit(LoadedTrack(await repository.fetchTrack()));
    });
  }
}
