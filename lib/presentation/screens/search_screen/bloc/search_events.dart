abstract class SearchEvent {}

class SearchTrackEvent extends SearchEvent {
  final String search;
  final int limit;

  SearchTrackEvent(this.search, this.limit);
}
