import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavoriteEvent {}

class LoadFavoriteEvent extends FavoriteEvent {}

class DeleteFavoriteEvent extends FavoriteEvent {
  DeleteFavoriteEvent(this.model);
  final TrackModel model;
}
