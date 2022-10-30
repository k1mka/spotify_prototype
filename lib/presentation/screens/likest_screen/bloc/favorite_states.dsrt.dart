import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavouriteState {}

class InitialFavoriteState extends FavouriteState {}

class LoadingFavoriteState extends FavouriteState {}

class LoadedFavoriteState extends FavouriteState {
  LoadedFavoriteState(this.favoriteList);
  final List<TrackModel> favoriteList;
}

class ErrorFavoriteState extends FavouriteState {
  ErrorFavoriteState(this.exception);
  final Object exception;
}
