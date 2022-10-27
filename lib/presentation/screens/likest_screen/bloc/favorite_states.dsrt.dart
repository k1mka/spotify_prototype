import 'package:spotify_prototype/data/models/track_model.dart';

abstract class LikestStates {}

class InitialState extends LikestStates {}

class LoadingFavorite extends LikestStates {}

class LoadedFavorite extends LikestStates {
  LoadedFavorite(this.favoriteList);
  final List<TrackModel> favoriteList;
}

class ErrorFavorite extends LikestStates {
  ErrorFavorite(this.exception);
  final Object exception;
}
