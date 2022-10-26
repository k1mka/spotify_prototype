import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_states.dart';

class PlayListBloc extends Bloc<TrackEvent, PlayListState> {
  Repository repository;

  PlayListBloc(this.repository) : super(InitialState()) {
    on<SearchTrackEvent>((event, emit) async {
      emit(LoadingTrack());

      try {
        emit(LoadedTrack(await repository.fetchTrack(search: event.search, limit: event.limit)));
      } catch (e) {
        emit(ErrorTrack(e));
      }
    });
  }
}
