import 'package:spotify_prototype/data/models/track_model.dart';

abstract class FavoriteEvents {}

class LoadedFavoriteEvent extends FavoriteEvents {}

class LikeTrackEvent extends FavoriteEvents {
  final TrackModel trackModel;

  LikeTrackEvent(this.trackModel);
}
