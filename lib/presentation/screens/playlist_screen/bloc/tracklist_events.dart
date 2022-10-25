abstract class TrackEvent {}

class SearchTrackEvent extends TrackEvent {
  final String search;
  final int limit;

  SearchTrackEvent(this.search, this.limit);
}
