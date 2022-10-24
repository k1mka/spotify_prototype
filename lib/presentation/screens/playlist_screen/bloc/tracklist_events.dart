abstract class TrackEvent {}

class LoadingTrackEvent extends TrackEvent {
  final String search;
  final int limit;

  LoadingTrackEvent(this.search, this.limit);
}
