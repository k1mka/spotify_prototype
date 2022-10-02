import 'package:spotify_prototype/data/models/track_model.dart';

abstract class PlayListState {}

class InitialState extends PlayListState {}

class LoadingTrack extends PlayListState {}

class LoadedTrack extends PlayListState {
  final List<TrackModel> playList;

  LoadedTrack(this.playList);
}

class ErrorTrack extends PlayListState {
  final Object exception;

  ErrorTrack(this.exception);
}
