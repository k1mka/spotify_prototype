import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavoriteState {}

class InitialFavoriteState extends FavoriteState {}

class LoadingFavoriteState extends FavoriteState {}

class LoadedFavoriteState extends FavoriteState {
  LoadedFavoriteState(this.favoriteList);
  final List<TrackModel> favoriteList;
}

class ErrorFavoriteState extends FavoriteState {
  ErrorFavoriteState(this.exception);
  final Object exception;
}
