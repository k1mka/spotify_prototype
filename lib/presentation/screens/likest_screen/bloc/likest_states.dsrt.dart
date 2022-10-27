import 'package:spotify_prototype/data/models/track_model.dart';

abstract class LikestStates {}

class InitialState extends LikestStates {}

class LoadingLike extends LikestStates {}

class LoadedLike extends LikestStates {
  LoadedLike(this.favoriteList);
  final List<TrackModel> favoriteList;
}

class ErrorLike extends LikestStates {
  ErrorLike(this.exception);
  final Object exception;
}
