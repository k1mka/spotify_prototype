import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavoriteEvent {}

class LoadFavoriteEvent extends FavoriteEvent {}

class LikeTrackEvent extends FavoriteEvent {
  final TrackModel trackModel;

  LikeTrackEvent(this.trackModel);
}
