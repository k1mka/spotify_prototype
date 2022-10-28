import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavouriteStates {}

class InitialState extends FavouriteStates {}

class LoadingFavorite extends FavouriteStates {}

class LoadedFavorite extends FavouriteStates {
  LoadedFavorite(this.favoriteList);
  final List<TrackModel> favoriteList;
}

class ErrorFavorite extends FavouriteStates {
  ErrorFavorite(this.exception);
  final Object exception;
}
