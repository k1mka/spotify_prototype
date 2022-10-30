import 'package:spotify_prototype/data/models/track_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState {}

class SearchingState extends SearchState {}

class LoadedSearchedTracksState extends SearchState {
  final List<TrackModel> playList;

  LoadedSearchedTracksState(this.playList);
}

class ErrorSearchState extends SearchState {
  final Object exception;

  ErrorSearchState(this.exception);
}
