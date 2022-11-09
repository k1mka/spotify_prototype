import 'package:spotify_prototype/data/models/track_model.dart';

abstract class SearchEvent {}

class SearchTrackEvent extends SearchEvent {
  final String search;
  final int limit;

  SearchTrackEvent(this.search, this.limit);
}

class LikeTrackEvent extends SearchEvent {
  final TrackModel trackModel;

  LikeTrackEvent(this.trackModel);
}

class DeleteFavoriteEvent extends SearchEvent {
  DeleteFavoriteEvent(this.model);
  final TrackModel model;
}
